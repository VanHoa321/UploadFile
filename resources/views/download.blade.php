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
            <button class="flex items-center space-x-1">
                <i class="fas fa-cloud-upload-alt text-xl"></i>
                <a href="/index" class="text-lg">Upload</a>
            </button>           
        </div>
    </div>
</header>

<div class="container mx-auto px-4">
    <div class="my-4">
        <img 
            alt="790x20 ad banner" 
            class="w-2/3 mx-auto h-90"
            height="10"
            src="{{ asset('img/3-1-1920x582.jpg') }}" 
            width="720"
        />
    </div>


    <div class="flex space-x-4 my-4">
        <img 
            alt="300x280 ad banner" 
            class="w-1/3" 
            height="280" 
            src="{{asset("img/1-1-370x400.jpg")}}" 
            width="300"
        />
        <div class="w-2/3 space-y-4">
            @foreach ($files as $items)
                <div class="flex items-center justify-between p-4 border rounded shadow-md hover:shadow-lg transition-shadow duration-300">
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-file-alt text-blue-500"></i>
                        <span>{{$items->file_name}}</span>
                        <span class="text-gray-500">({{ number_format($items->file_size / 1024, 2) }} KB)</span>
                    </div>
                    <a href="{{ route('download.file', $items->id) }}" class="bg-blue-500 text-white px-4 py-2 rounded transition duration-300 hover:bg-blue-600" download>
                        TẢI VỀ ({{ number_format($items->file_size / 1024, 2) }} KB)
                    </a>
                </div>
            @endforeach
            <div class="my-4 text-sm pl-2">
                <p><b>Ngày tải lên:</b> Cách đây 14 phút trước.</p>
                <p><b>Thời gian lưu trữ đến:</b> 15:45 phút, 25 tháng 9, 2024</p>
            </div>
        </div>
    </div>

    

    <div class="my-8">
        <div class="border-b-2 border-blue-500 mt-2 w-10"></div>
        <h2 class="text-xl font-bold">Về Nhanh.cc</h2>
        <p>
            <strong>Nhanh.cc</strong> là một nền tảng chia sẻ file tạm thời nhanh chóng và trực tuyến. 
            Nhanh.cc chỉ lưu trữ dữ liệu do người dùng tải lên tối đa là 3 ngày, tất cả các file và định dạng đều được hỗ trợ. 
            Chỉ những ai có đường dẫn mới có thể xem và tải về.
        </p>
    </div>
</div>

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
<div class="border-t border-gray-300 my-4"></div> 
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

