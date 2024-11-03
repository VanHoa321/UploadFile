<!DOCTYPE html>
<html lang="en" id="upload">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>ImgBB</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>
<style>
    @keyframes slideDown {
        from {
            transform: translateY(-100%);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    @keyframes slideUp {
        from {
            transform: translateY(0);
            opacity: 1;
        }
        to {
            transform: translateY(-100%);
            opacity: 0;
        }
    }

    #uploadModal {
        animation-duration: 0.5s;
        animation-fill-mode: forwards;
    }

    #uploadModal.slide-in {
        animation-name: slideDown;
    }

    #uploadModal.slide-out {
        animation-name: slideUp;
    }
</style>
<body class="bg-white text-gray-800">

<header class="sticky top-0 z-10 bg-white border-b shadow">
    <div class="flex justify-between items-center p-4 justify-center">
        <div class="flex items-center space-x-4">
        <a href="{{route('home')}}"><i class="fas fa-home text-xl"></i>Trang chủ</a>
            <a href="#" class="text-gray-600 hover:text-gray-800"><i class="fas fa-question-circle"></i> Giới thiệu</a>
            <div class="relative">
                <button class="flex items-center space-x-1 text-gray-600 hover:text-gray-800">
                    <i class="fas fa-language"></i>
                    <span>VI</span>
                    <i class="fas fa-caret-down"></i>
                </button>
            </div>
        </div>
        <div class="text-center align-self-center" style="margin-right:80px">
            <img src="{{asset('img/logo/imgbb.png')}}" alt="">
        </div>
        <div class="flex items-center space-x-4">
            @auth
                <button id="modalOpenBtn" class="flex items-center space-x-1">
                    <i class="fas fa-cloud-upload-alt text-xl"></i>
                    <span class="text-lg">Upload</span>
                </button>
                <div class="relative" x-data="{ open: false }">
                    <a href="#" @click.prevent="open = !open" class="flex items-center space-x-1">
                        <span class="text-lg">{{ Auth::user()->user_name }}</span>
                        <i class="fas fa-chevron-down"></i>
                    </a>
                    <div x-show="open" @click.outside="open = false" class="absolute right-0 mt-2 w-32 bg-white border rounded shadow-lg z-10" 
                        style="display: none;" x-bind:style="{ display: open ? 'block' : 'none' }">
                        <a href="{{route('download')}}" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">File của tôi</a>
                        <a href="{{route('logout')}}" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">Đăng xuất</a>
                    </div>
                </div>
            @else
                <a href="{{ route('login') }}">
                    <i class="fas fa-sign-in-alt"></i> Đăng nhập
                </a>
                <a href="{{ route('register') }}">
                    <i class="fas fa-user-plus"></i> Đăng ký
                </a>
            @endauth
        </div>
    </div>
</header>

@yield("content")

<!-- Modal -->
<div id="uploadModal" class="fixed inset-x-0 top-[4.0rem] bg-gray-900 bg-opacity-70 z-50 hidden flex items-center justify-center">
    <div class="bg-white w-full h-[70%] p-6 shadow-lg max-h-[70vh] overflow-y-auto overflow-hidden " ondrop="dropHandler(event)" ondragover="dragOverHandler(event)">
        <div class="text-left text-xs text-gray-500 leading-tight">
            DOC, PDF, ZIP, PHP, TEXT, JPG PNG BMP GIF TIF WEBP HEIC AVIF PDF... GIỚI HẠN: 10MB
        </div>
        <button id="closeModal" class="absolute top-4 right-4 text-gray-600 hover:text-gray-800 flex items-center">
            <i class="fas fa-times"></i><span class="text-xs text-gray-500 ml-1">Đóng</span>
        </button>
        <main class="mt-8 text-center"> 
            <label for="fileInput" class="cursor-pointer">
                <span style="color:#2a80b9" class="fa-7x mt-10 fa-solid fa-cloud-arrow-up my-3"></span>
                <input type="file" id="fileInput" name="files[]" multiple class="hidden" />
            </label>
            <p class="text-2xl font-semi mb-3 text-gray-900 flex flex-wrap justify-center"> Kéo thả hoặc paste (Ctrl + V) ảnh vào đây để upload</p>
            <p class="text-sm text-gray-500 mb-10">Bạn có thể thêm nhiều dữ liệu nữa từ <a href="#" class="text-blue-500">máy tính của bạn</a> hoặc <a href="#" class="text-blue-500">thêm địa chỉ tài nguyên</a>.</p>   
            <div id="fileList" class="flex justify-center mt-8 space-x-4 flex-wrap"></div>
            <div id="listDownload" class="flex justify-center mt-8 flex-col"></div>
            <div id="autoDeleteSection" class="mt-4 hidden">
                <label class="block text-sm font-bold mb-1" for="auto-delete">
                    Tự động xóa ảnh
                </label>
                <select class="border p-2 mt-2 mx-auto w-full max-w-xs" id="auto-delete">
                    <option value="0">Không xóa</option>
                    <option value="1">Sau 1 ngày</option>
                    <option value="7">Sau 7 ngày</option>
                    <option value="30">Sau 30 ngày</option>
                </select>
            </div>
            <button id="uploadBtn" class="mt-8 bg-green-500 text-white px-6 py-2 rounded hidden">
                TẢI LÊN NGAY
            </button>
        </main>
    </div>
</div>
<div id="modalOverlay" class="bg-opacity-85 fixed inset-0 top-[4.0rem] bg-black z-40 hidden"></div>

<footer class="text-center py-4 text-gray-600">
    <div class="flex justify-center space-x-4 mb-2">
        <a href="#" class="hover:underline text-blue-500">Giới thiệu</a>
        <a href="#" class="hover:underline text-blue-500">Liên hệ</a>
    </div>
    <p>Sử dụng 10MB.cc là bạn đã đồng ý với <a href="#" class="hover:underline text-blue-500">Quy định sử dụng</a> và <a href="#" class="hover:underline text-blue-500">Chính sách bảo mật</a>.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.10.5/cdn.min.js" defer></script>
<script>
    
    const uploadedFiles = [];

    document.getElementById('modalOpenBtn').addEventListener('click', function() {
        const modal = document.getElementById('uploadModal');
        modal.classList.remove('hidden', 'slide-out');
        modal.classList.add('slide-in');

        document.getElementById('modalOverlay').classList.remove('hidden');
    });

    document.getElementById('closeModal').addEventListener('click', function() {
        const modal = document.getElementById('uploadModal');
        modal.classList.remove('slide-in');
        modal.classList.add('slide-out');

        setTimeout(function() {
            modal.classList.add('hidden');
            $('#fileList').empty();
            uploadedFiles.length = 0;
            document.getElementById('autoDeleteSection').classList.add('hidden');
            document.getElementById('uploadBtn').classList.add('hidden');
            document.getElementById('modalOverlay').classList.add('hidden');
            $('#listDownload').empty();
        }, 500);
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

            uploadedFiles.push(file);
            let filePreview;
            const fileExtension = file.name.split('.').pop().toLowerCase();

            // Kiểm tra nếu file là hình ảnh thì hiện ảnh, nếu không hiển thị icon tương ứng
            if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'tif'].includes(fileExtension)) {
                filePreview = `<img alt="${file.name}" title="${file.name}" class="border w-28 h-32 object-cover" src="${URL.createObjectURL(file)}" />`;
            } else {
                let iconClass;
                switch (fileExtension) {
                    case 'rar':
                    case 'zip':
                        iconClass = 'fas fa-file-archive text-yellow-500'; break;
                    case 'pdf':
                        iconClass = 'fas fa-file-pdf text-red-500'; break;
                    case 'doc':
                    case 'docx':
                        iconClass = 'fas fa-file-word text-blue-500'; break;
                    case 'xls':
                    case 'xlsx':
                        iconClass = 'fas fa-file-excel text-green-500'; break;
                    case 'ppt':
                    case 'pptx':
                        iconClass = 'fas fa-file-powerpoint text-orange-500'; break;
                    case 'txt':
                        iconClass = 'fas fa-file-alt text-gray-500'; break;
                    case 'csv':
                        iconClass = 'fas fa-file-csv text-green-600'; break;
                    case 'mp3':
                        iconClass = 'fas fa-file-audio text-purple-500'; break;
                    case 'mp4':
                        iconClass = 'fas fa-file-video text-blue-600'; break;
                    case 'json':
                        iconClass = 'fas fa-file-code text-teal-500'; break;
                    case 'xml':
                        iconClass = 'fas fa-file-code text-orange-600'; break;
                    default:
                        iconClass = 'fas fa-file text-gray-500';
                }
                filePreview = `<i class="${iconClass} border w-28 h-32 text-7xl flex items-center justify-center" title="${file.name}"></i>`;
            }

            const fileDiv = $('<div class="relative inline-block m-1"></div>').append(`
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
</script>
@yield("scripts")
</body>
</html>