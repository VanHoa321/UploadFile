<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ImgBB</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body class="bg-white text-gray-800">

<header class="sticky top-0 z-10 bg-white border-b shadow">
    <div class="flex justify-between items-center p-4">
        <div class="flex items-center space-x-4">
            <a href="#" class="text-gray-600 hover:text-gray-800"><i class="fas fa-question-circle"></i> Giới thiệu</a>
            <div class="relative">
                <button class="flex items-center space-x-1 text-gray-600 hover:text-gray-800">
                    <i class="fas fa-language"></i>
                    <span>VI</span>
                    <i class="fas fa-caret-down"></i>
                </button>
            </div>
        </div>
        <div class="text-center">
            <h1 class="text-2xl font-bold text-blue-600">ImgBB</h1>
        </div>
        <div>
            <button id="uploadBtn" class="flex items-center space-x-1">
                <i class="fas fa-cloud-upload-alt text-xl"></i>
                <span class="text-lg">Upload</span>
            </button>           
        </div>
    </div>
</header>

<main class="flex flex-col items-center justify-center min-h-screen">
    <div class="text-center">
        <h2 class="text-3xl font-bold mb-4">Đăng và chia sẻ dữ liệu trực tuyến</h2>
        <p class="text-gray-600 mb-6">Kéo thả dữ liệu hoặc hình ảnh của bạn vào bất kỳ đâu để bắt đầu tải lên ngay. Giới hạn 10 MB. Liên kết trực tiếp đến dữ liệu, mã BBCode và hình thu nhỏ HTML.</p>
        <a href="/download" class="bg-blue-600 text-white px-6 py-2 rounded">START UPLOADING</a>
    </div>
</main>

<section class="bg-gray-100 py-16">
    <div class="text-center">
        <h3 class="text-2xl font-bold mb-2">Nội dung trang chủ</h3>
        <p class="text-gray-600">Đoạn này là bài viết giới thiệu để SEO</p>
    </div>
</section>

<!-- Modal -->
<div id="uploadModal" class="fixed bg-opacity-70 inset-x-0 top-[4.0rem] bg-gray-900 hidden flex items-center justify-center">
    <div class="bg-white w-full h-[70%] p-6 shadow-lg overflow-y-auto relative">
        <div class="text-left text-xs text-gray-500 leading-tight">
            DOC, PDF, ZIP, PHP, TEXT, JPG PNG BMP GIF TIF WEBP HEIC AVIF PDF... GIỚI HẠN: 10MB
        </div>
        <button id="closeModal" class="absolute top-4 right-4 text-gray-600 hover:text-gray-800 flex items-center">
            <i class="fas fa-times"></i><span class="text-xs text-gray-500 ml-1">Đóng</span>
        </button>
        <div class="flex flex-col items-center justify-center space-y-4 mt-8 mb-20">
            <i class="fas fa-cloud-upload-alt text-7xl text-blue-500"></i>
            <p class="mt-4 text-lg">Kéo thả hoặc paste (Ctrl + V) ảnh vào đây để upload</p>
            <p class="text-sm text-gray-500">Bạn có thể <a href="#" class="text-blue-500">tải lên từ máy tính</a> hoặc <a href="#" class="text-blue-500">thêm địa chỉ ảnh</a>.</p>         
        </div>
    </div>
</div>


<footer class="text-center py-4 text-gray-600">
    <div class="flex justify-center space-x-4 mb-2">
        <a href="#" class="hover:underline text-blue-500">Giới thiệu</a>
        <a href="#" class="hover:underline text-blue-500">Liên hệ</a>
    </div>
    <p>Sử dụng 10MB.cc là bạn đã đồng ý với <a href="#" class="hover:underline text-blue-500">Quy định sử dụng</a> và <a href="#" class="hover:underline text-blue-500">Chính sách bảo mật</a>.</p>
</footer>

<script>
    // Hiển thị modal
    document.getElementById('uploadBtn').addEventListener('click', function() {
        document.getElementById('uploadModal').classList.remove('hidden');
    });

    // Đóng modal
    document.getElementById('closeModal').addEventListener('click', function() {
        document.getElementById('uploadModal').classList.add('hidden');
    });
</script>

</body>
</html>
