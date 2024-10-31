<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FileController;


Route::get('/index', function () {
    return view('upload');
});
Route::get('/',[FileController::class, "index"])->name("index");

Route::get('/download',[FileController::class, "index"])->name("index");
Route::post('/upload', [FileController::class, 'store'])->name('upload');
Route::get('/download/{id}', [FileController::class, 'download'])->name('download.file');