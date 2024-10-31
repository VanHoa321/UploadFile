@extends("layout")

@section("content")
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
                class="w-1/3 h-96 object-cover" 
                src="{{ asset('img/1-1-370x400.jpg') }}" 
            />
            <div class="w-2/3 space-y-4">
                @foreach ($files as $items)
                    <div class="flex items-center justify-between p-4 border rounded shadow-md hover:shadow-lg transition-shadow duration-300">
                        <div class="flex items-center space-x-2">
                            @php
                                // Xác định định dạng file và biểu tượng
                                $fileExtension = strtolower(pathinfo($items->file_name, PATHINFO_EXTENSION));
                                $iconClass = '';
                                switch ($fileExtension) {
                                    case 'jpg': case 'jpeg':
                                        $iconClass = 'fas fa-file-image text-blue-500';
                                        break;
                                    case 'png':
                                        $iconClass = 'fas fa-file-image text-green-500';
                                        break;
                                    case 'gif':
                                        $iconClass = 'fas fa-file-image text-yellow-500';
                                        break;
                                    case 'pdf':
                                        $iconClass = 'fas fa-file-pdf text-red-500';
                                        break;
                                    case 'doc': case 'docx':
                                        $iconClass = 'fas fa-file-word text-blue-500';
                                        break;
                                    case 'xls': case 'xlsx':
                                        $iconClass = 'fas fa-file-excel text-green-500';
                                        break;
                                    case 'zip': case 'rar':
                                        $iconClass = 'fas fa-file-archive text-orange-500';
                                        break;
                                    default:
                                        $iconClass = 'fas fa-file text-gray-500';
                                }
                            @endphp
                            <i class="{{ $iconClass }}"></i>
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
@endsection


