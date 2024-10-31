<!DOCTYPE html>
<html lang="en" id="upload">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>ImgBB</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

</head>
<body class="bg-white text-gray-800">

<header class="sticky top-0 z-10 bg-white border-b shadow">
    <div class="flex justify-between items-center p-4 justify-center">
        <div class="flex items-center space-x-4">
        <a href="{{route('index')}}"><i class="fas fa-home text-xl"></i>Trang chủ</a>
            <a href="#" class="text-gray-600 hover:text-gray-800"><i class="fas fa-question-circle"></i> Giới thiệu</a>
            <div class="relative">
                <button class="flex items-center space-x-1 text-gray-600 hover:text-gray-800">
                    <i class="fas fa-language"></i>
                    <span>VI</span>
                    <i class="fas fa-caret-down"></i>
                </button>
            </div>
        </div>
        <div class="text-center align-self-center" style="margin-right:160px">
            <img src="{{asset('img/logo/imgbb.png')}}" alt="">
        </div>
        <div>
            <button id="modalOpenBtn" class="flex items-center space-x-1">
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
<div id="uploadModal" class="fixed inset-x-0 top-[4.0rem] bg-gray-900 bg-opacity-70 z-50 hidden flex items-center justify-center">
    <div class="bg-white w-full h-[70%] p-6 shadow-lg overflow-y-auto" ondrop="dropHandler(event)" ondragover="dragOverHandler(event)">
        <div class="text-left text-xs text-gray-500 leading-tight">
            DOC, PDF, ZIP, PHP, TEXT, JPG PNG BMP GIF TIF WEBP HEIC AVIF PDF... GIỚI HẠN: 10MB
        </div>
        <button id="closeModal" class="absolute top-4 right-4 text-gray-600 hover:text-gray-800 flex items-center">
            <i class="fas fa-times"></i><span class="text-xs text-gray-500 ml-1">Đóng</span>
        </button>
        <main class="mt-8 text-center"> 
            <label for="fileInput" class="cursor-pointer">
                <i class="fas fa-images text-7xl text-blue-500"></i>
                <input type="file" id="fileInput" name="files[]" multiple class="hidden" />
            </label>
            <p class="mt-4 text-lg">Thêm hoặc xóa bất cứ tài nguyên nào của bạn</p>
            <p class="text-sm text-gray-500">Bạn có thể thêm nhiều dữ liệu nữa từ <a href="#" class="text-blue-500">máy tính của bạn</a> hoặc <a href="#" class="text-blue-500">thêm địa chỉ tài nguyên</a>.</p>   
            <div id="fileList" class="flex justify-center mt-8 space-x-4"></div>
            <div id="listDownload" class="flex justify-center mt-8 flex-col"></div>
            <div id="autoDeleteSection" class="mt-8 hidden">
                <label class="block text-sm font-bold mb-1" for="auto-delete">
                    Tự động xóa ảnh
                </label>
                <select class="border p-2 mt-2 mx-auto w-full max-w-xs" id="auto-delete">
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
<div id="modalOverlay" class="fixed inset-0 top-[4.0rem] bg-gray-400 z-40 hidden"></div>

<footer class="text-center py-4 text-gray-600">
    <div class="flex justify-center space-x-4 mb-2">
        <a href="#" class="hover:underline text-blue-500">Giới thiệu</a>
        <a href="#" class="hover:underline text-blue-500">Liên hệ</a>
    </div>
    <p>Sử dụng 10MB.cc là bạn đã đồng ý với <a href="#" class="hover:underline text-blue-500">Quy định sử dụng</a> và <a href="#" class="hover:underline text-blue-500">Chính sách bảo mật</a>.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="{{ asset('js/upload.js') }}"></script>
</body>
</html>