<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FileController;
use App\Http\Controllers\UserController;

Route::get('/', function () {
    return view('home');
})->name('home');

Route::get('/download',[FileController::class, "index"])->name("download");
Route::post('/upload', [FileController::class, 'store'])->name('upload');
Route::get('/download/{id}', [FileController::class, 'download'])->name('download.file');
Route::get('/login',[UserController::class, "login"])->name("login");
Route::get('/register',[UserController::class, "register"])->name("register");
Route::post('/post-login', [UserController::class, 'postLogin'])->name('postLogin');
Route::get('/logout', [UserController::class, 'logout'])->name('logout');
Route::post('/post-register', [UserController::class, 'postRegister'])->name('postRegister');
Route::get('/verify/{email}',[UserController::class, "verify"])->name("verify");