@extends("layout")

@section("content")
    <main class="flex flex-col items-center justify-center min-h-screen">
        @if(Session::has('messenge') && is_array(Session::get('messenge')))
            @php
                $messenge = Session::get('messenge');
            @endphp
            @if(isset($messenge['style']) && isset($messenge['msg']))
                <div class="alert alert-{{ $messenge['style'] }}" role="alert" style="width: auto; z-index: 999" id="myAlert">
                    <i class="bi bi-check2 text-{{ $messenge['style'] }}"></i>{{ $messenge['msg'] }}
                </div>
                @php
                    Session::forget('messenge');
                @endphp
            @endif
        @endif    
        <div class="flex items-center justify-between space-x-4">
            <div class="w-full max-w-md">
                <h2 class="text-2xl font-bold mb-6 text-center">
                    Đăng ký
                </h2>
                <form class="space-y-4" action="{{route('postRegister')}}" method="POST">
                    @csrf
                    <div>
                        <label class="block text-gray-700 font-bold mb-1">
                            Đia chỉ Email
                        </label>
                        <input class="w-full px-4 py-2 border rounded" name="email" placeholder="Địa chỉ email" type="text" />
                    </div>
                    <div>
                        <label class="block text-gray-700 font-bold mb-1">
                            Tên tài khoản
                        </label>
                        <input class="w-full px-4 py-2 border rounded" name="uname" placeholder="Tên tài khoản" type="text" />
                    </div>
                    <div>
                        <label class="block text-gray-700 font-bold mb-1">
                            Mật khẩu
                        </label>
                        <input class="w-full px-4 py-2 border rounded" name="pw" placeholder="Nhập mật khẩu của bạn" type="password" />
                    </div>
                    <div>
                        <input id="agree" type="checkbox"/>
                        <label for="agree">Tôi đồng ý với
                            <a class="text-blue-500" href="#">quy định</a>và<a class="text-blue-500" href="#">chính sách bảo mật</a>
                        </label>
                    </div>
                    <div class="flex justify-between items-center">
                        <button class="bg-gray-200 px-4 py-2 rounded" type="submit">
                            Đăng ký
                        </button>                        
                    </div>
                </form>
                <div class="text-center my-4 text-gray-500">
                    - HOẶC -
                </div>
                <div class="text-center mb-4">
                    Đăng nhập với tài khoản khác
                </div>
                <div class="flex justify-center space-x-4">
                    <button class="bg-blue-600 text-white px-4 py-2 rounded">
                        <i class="fab fa-facebook-f"></i> Facebook
                    </button>
                    <button class="bg-red-600 text-white px-4 py-2 rounded">
                        <i class="fab fa-google"></i> Google
                    </button>
                    <button class="bg-blue-500 text-white px-4 py-2 rounded">
                        <i class="fab fa-vk"></i> VK
                    </button>
                </div>
            </div>
        </div>
    </main>
@endsection