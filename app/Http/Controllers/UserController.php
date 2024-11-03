<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\VerifyAccount;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class UserController extends Controller
{
    public function login() {
        return view('login');
    }

    public function postLogin(Request $request){
        $user = User::where('user_name', $request->uname)->first();
        if ($user) {
            if (is_null(value: $user->email_verified_at)) {
                $request->session()->put("messenge", ["style" => "danger", "msg" => "Tài khoản chưa được xác minh"]);
                return redirect()->route("login");
            }
            if ($user->status == 0) {
                $request->session()->put("messenge", ["style" => "danger", "msg" => "Tài khoản của bạn đã bị khóa"]);
                return redirect()->route("login");
            }
    
            if(Auth::attempt(["user_name"=>$request->uname,"password"=>$request->pw])){
                $request->session()->put("messenge", ["style"=>"success","msg"=>"Đăng nhập thành công"]);
                return redirect()->route("home");
            }
        }
        $request->session()->put("messenge", ["style"=>"danger","msg"=>"Thông tin tài khoản không đúng"]);
        return redirect()->route("login");
    }

    public function logout(){
        Auth::logout();
        return redirect()->route("home");
    }

    public function register() {
        return view('register');
    }

    public function postRegister(Request $request){
        if (User::where('email', $request->email)->exists()) {
            $request->session()->put("messenge", ["style" => "danger", "msg" => "Email đã tồn tại!"]);
            return redirect()->back()->withInput();
        }

        if (User::where('user_name', $request->uname)->exists()) {
            $request->session()->put("messenge", ["style" => "danger", "msg" => "Tên tài khoản đã tồn tại!"]);
            return redirect()->back()->withInput();
        }

        $create = new User();
        $create->email = $request->email;
        $create->user_name = $request->uname;
        $create->password = Hash::make($request->pw);
        $create->status = 0;
        $create->save();
        Mail::to('vanhoa12092003@gmail.com')->send(new VerifyAccount($create, $request->pw));
        $request->session()->put("messenge", ["style"=>"success","msg"=>"Đăng ký tài khoản thành công, hãy xác minh email để đăng nhập"]);
        return redirect()->route("register");
    }

    public function verify($email){
        $acc = User::where('email', $email)->whereNull('email_verified_at');
        if ($acc) {
            $acc->update([
                'email_verified_at' => date('Y-m-d'),
                'status' => 1
            ]);
            return redirect()->route("login");
        }
    }
}
