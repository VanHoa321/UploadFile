<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <title>Giao Diện Tải Dữ Liệu</title>
</head>
<body class="bg-gray-800 flex items-center justify-center h-screen">

    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-semibold text-gray-800">Đường dẫn tải dữ liệu</h2>
            <button class="text-gray-500 hover:text-gray-700 focus:outline-none">
                <i class="fas fa-times"></i>
            </button>
        </div>

        <div class="flex mb-4">
            <div class="flex items-center justify-center w-1/2">
                <img alt="QR code for downloading data" class="w-32 h-32" src="https://storage.googleapis.com/a1aa/image/cOcWfF8TIXS3LS7w07NGPPcpW9QpcLFVuEAwTv8nZipNityJA.jpg"/>
            </div>
            <div class="flex items-center justify-center w-1/2">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                    Tải về máy
                </button>
            </div>
        </div>

        <div class="flex mb-4">
            <div class="flex-1">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="short-link">Link rút gọn</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="short-link" readonly type="text" value="https://chanh.in/iDheA"/>
            </div>
            <div class="flex items-center ml-2">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Sao chép</button>
            </div>
        </div>

        <div class="flex justify-center space-x-2 mb-4">
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold py-2 px-3 rounded-full flex items-center">
                <i class="fab fa-facebook-f"></i>
            </button>
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold py-2 px-3 rounded-full flex items-center">
                <i class="fab fa-twitter"></i>
            </button>
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold py-2 px-3 rounded-full flex items-center">
                <i class="fab fa-linkedin-in"></i>
            </button>
        </div>

        <div class="flex justify-between items-center">
            <select class="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold py-2 px-4 rounded">
                <option>PNG</option>
                <option>JPG</option>
                <option>PDF</option>
            </select>
            <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                Xong
            </button>
        </div>
    </div>

</body>
</html>
