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
                    Đăng nhập
                </h2>
                <form class="space-y-4" action="{{route('postLogin')}}" method="POST">
                    @csrf
                    <div>
                        <label class="block text-gray-700 font-bold mb-1">
                            Tên người dùng
                        </label>
                        <input class="w-full px-4 py-2 border rounded" name="uname" placeholder="Nhập tên người dùng" type="text" />
                    </div>
                    <div>
                        <label class="block text-gray-700 font-bold mb-1">
                            Mật khẩu
                        </label>
                        <input class="w-full px-4 py-2 border rounded" name="pw" placeholder="Nhập mật khẩu của bạn" type="password" />
                    </div>
                    <div class="flex justify-between items-center">
                        <button class="bg-gray-200 px-4 py-2 rounded" type="submit">
                            Đăng nhập
                        </button>
                        <a class="text-blue-500" href="#">
                            Quên mật khẩu?
                        </a>
                    </div>
                </form>
                <div class="text-center my-4 text-gray-500">
                    - HOẶC -
                </div>
                <div class="text-center mb-4">
                    Đăng nhập với tài khoản khác
                </div>
                <div class="flex justify-center space-x-4">
                    <a href="{{ route('facebook.redirect') }}" class="bg-blue-600 text-white px-4 py-2 rounded">
                        <i class="fab fa-facebook-f"></i> Facebook
                    </a>
                    <a href="{{ route('google.redirect') }}" class="bg-red-600 text-white px-4 py-2 rounded">
                        <i class="fab fa-google"></i> Google
                    </a>
                    <a href="{{ route('github.redirect') }}" class="bg-blue-500 text-white px-4 py-2 rounded">
                        <i class="fab fa-github"></i> GitHub
                    </a>
                </div>
            </div>
        </div>
    </main>
@endsection