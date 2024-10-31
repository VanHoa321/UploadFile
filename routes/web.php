<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FileController;


Route::get('/', function () {
    return view('home');
})->name('home');

Route::get('/download',[FileController::class, "index"])->name("index");
Route::get('/download/{id}', [FileController::class, 'download'])->name('download.file');