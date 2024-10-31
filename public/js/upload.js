
const uploadedFiles = [];

document.getElementById('modalOpenBtn').addEventListener('click', function() {
    document.getElementById('uploadModal').classList.remove('hidden');
    document.getElementById('modalOverlay').classList.remove('hidden');
});

document.getElementById('closeModal').addEventListener('click', function() {
    document.getElementById('uploadModal').classList.add('hidden');
    $('#fileList').empty();
    uploadedFiles.length = 0;
    document.getElementById('autoDeleteSection').classList.add('hidden');
    document.getElementById('uploadBtn').classList.add('hidden');
    document.getElementById('modalOverlay').classList.add('hidden');
});

$('#fileInput').on('change', handleFiles);

// Xử lý thả file vào khu vực modal
function dropHandler(event) {
    event.preventDefault();
    handleFiles(event);
}

function dragOverHandler(event) {
    event.preventDefault();
}

//Paste files
document.getElementById('upload').addEventListener('paste', function(event) {
    // Ngăn chặn hành động mặc định của sự kiện
    event.preventDefault();
    document.getElementById('uploadModal').classList.remove('hidden');
    document.getElementById('modalOverlay').classList.remove('hidden');

    // Lấy dữ liệu từ clipboard
    const items = (event.clipboardData || window.clipboardData).items;

    for (let i = 0; i < items.length; i++) {
        const item = items[i];
        if (item.kind === 'file') {
            const file = item.getAsFile();
            if (file) {
                handleFiles({ target: { files: [file] } });
            }
        } else if (item.kind === 'string') {
            // Nếu là ảnh từ clipboard
            item.getAsString((url) => {
                fetch(url)
                    .then(response => response.blob())
                    .then(blob => {
                        const file = new File([blob], 'pasted-image.png', { type: blob.type });
                        handleFiles({ target: { files: [file] } });
                    });
            });
        }
    }
});

// Hàm xử lý file
function handleFiles(event) {
    const files = event.target.files || event.dataTransfer.files;

    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        if (uploadedFiles.some(uploadedFile => uploadedFile.name === file.name)) continue;

        uploadedFiles.push(file);
        let filePreview;
        const fileExtension = file.name.split('.').pop().toLowerCase();

        // Kiểm tra nếu file là hình ảnh thì hiện ảnh, nếu không hiển thị icon tương ứng
        if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'tif'].includes(fileExtension)) {
            filePreview = `<img alt="${file.name}" title="${file.name}" class="border w-24 h-24 object-cover" src="${URL.createObjectURL(file)}" />`;
        } else {
            let iconClass;
            switch (fileExtension) {
                case 'rar': case 'zip':
                    iconClass = 'fas fa-file-archive text-yellow-500'; break;
                case 'pdf':
                    iconClass = 'fas fa-file-pdf text-red-500'; break;
                case 'doc': case 'docx':
                    iconClass = 'fas fa-file-word text-blue-500'; break;
                case 'xls': case 'xlsx':
                    iconClass = 'fas fa-file-excel text-green-500'; break;
                default:
                    iconClass = 'fas fa-file text-gray-500';
            }
            filePreview = `<i class="${iconClass} border w-24 h-24 text-7xl flex items-center justify-center" title="${file.name}"></i>`;
        }

        const fileDiv = $('<div class="relative"></div>').append(`
            ${filePreview}
            <button class="absolute top-0 left-0 bg-white rounded-full w-4 h-4 flex items-center justify-center shadow hover:shadow-md transition-shadow duration-300">
                <i class="fas fa-times text-black-250 text-xs" onclick="removeFile(this)"></i>
            </button>
            <button class="absolute top-4 left-0 bg-white rounded-full w-4 h-4 flex items-center justify-center shadow hover:shadow-md transition-shadow duration-300">
                <i class="fas fa-pen text-black-200 text-xs"></i>
            </button>
        `);

        $('#fileList').append(fileDiv);
    }

    if ($('#fileList').children().length > 0) {
        document.getElementById('autoDeleteSection').classList.remove('hidden');
        document.getElementById('uploadBtn').classList.remove('hidden');
    }
    else {
        document.getElementById('autoDeleteSection').classList.add('hidden');
        document.getElementById('uploadBtn').classList.add('hidden');
    }
}

function removeFile(button) {
    const fileDiv = button.closest('.relative');
    const fileName = fileDiv.querySelector('img, i').getAttribute('title'); // Lấy tên file từ thuộc tính `title`

    const index = uploadedFiles.findIndex(file => file.name === fileName);
    if (index !== -1) {
        uploadedFiles.splice(index, 1);
    }

    fileDiv.remove();

    if (document.getElementById('fileList').children.length === 0) {
        document.getElementById('autoDeleteSection').classList.add('hidden');
        document.getElementById('uploadBtn').classList.add('hidden');
    }
}

function copyToClipboard(text) {
// Tạo một thẻ input tạm thời để chứa nội dung cần sao chép
    const tempInput = document.createElement('input');
    tempInput.value = text;
    document.body.appendChild(tempInput);
    tempInput.select();
    document.execCommand('copy');
    document.body.removeChild(tempInput);
    toastr.success('Sao chép thành công!');
}

// Sự kiện click nút upload
let isUploading = false;
$('#uploadBtn').on('click', function() {
    if (isUploading) return;
    isUploading = true;
    $(this).prop('disabled', true);
    const maxSize = 10 * 1024 * 1024;
    const invalidFiles = uploadedFiles.filter(file => file.size > maxSize);

    if (invalidFiles.length > 0) {
        toastr.error("Chỉ cho phép upload file dưới 10MB!");
        $(this).prop('disabled', false);
        isUploading = false;
        return; 
    }
    const formData = new FormData();
    uploadedFiles.forEach(file => {
        formData.append('files[]', file);
    });

    formData.append('autoDelete', $('#auto-delete').val());

    $.ajax({
        url: '/upload',
        type: 'POST',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            toastr.success(response.message);
            $('#fileInput').siblings('i').removeClass('fas fa-images').addClass('fas fa-check text-green-500');
            $('#fileInput').removeAttr('id');
            $('#fileList').children().each(function() {
                $(this).find('button').remove();
            });
            response.downloadLinks.forEach(function(link) {
                const linkDiv = `
                    <div class="flex justify-center items-center mt-2 flex">
                        <input class="border p-2 w-80 max-w-lg" readonly type="text" value="${link}"/>
                        <button class="bg-gray-200 p-2 ml-2" onclick="copyToClipboard('${link}')">SAO CHÉP</button>
                    </div>
                `;
                    $('#listDownload').append(linkDiv);
                });
            document.getElementById('autoDeleteSection').classList.add('hidden');
            document.getElementById('uploadBtn').classList.add('hidden');
        },
        error: function(error) {
            console.error("Error response:", error.responseText);
            toastr.error("Có lỗi xảy ra, vui lòng thử lại!");
        },
        complete: function() {
            $('#uploadBtn').prop('disabled', false);
            isUploading = false;
        }
    });
});