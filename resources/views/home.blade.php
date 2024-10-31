@extends("layout")

@section("content")
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
@endsection