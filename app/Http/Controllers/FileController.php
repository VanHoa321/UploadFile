<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\files;
use App\Repositories\FileRepositoryInterface;

class FileController extends Controller
{
    protected $fileRepository;

    public function __construct(FileRepositoryInterface $fileRepository) {
        $this->fileRepository = $fileRepository;
    }

    public function index() {
        $files = $this->fileRepository->all();
        return view('download', compact('files'));
    }

    public function store(Request $request) {
        $request->validate([
            'files.*' => 'file|max:10240',
        ]);
        $downloadLinks = [];       
        if ($request->hasFile('files')) {
            $files = $request->file('files');
            foreach ($files as $uploadedFile) {
                $existingFile = $this->fileRepository->find($uploadedFile->getClientOriginalName());

                if (!$existingFile) {
                    $fileData = [
                        'file_name' => $uploadedFile->getClientOriginalName(),
                        'file_path' => 'public/img/' . $uploadedFile->getClientOriginalName(),
                        'file_type' => $uploadedFile->getClientMimeType(),
                        'file_size' => $uploadedFile->getSize(),
                    ];

                    $this->fileRepository->create($fileData);
                    $uploadedFile->move(public_path('img'), $uploadedFile->getClientOriginalName());
                    $downloadLinks[] = url('http://127.0.0.1:8000/download/' . $uploadedFile->getClientOriginalName());
                }
            }
        }

        return response()->json([
            'message' => 'Tải danh sách Files thành công',
            'downloadLinks' => $downloadLinks
        ]);
    }

    public function download($id) {
        $file = $this->fileRepository->find($id);
        if ($file) {
            $path = public_path('img/'. $file->file_name);
            return response()->download($path);
        }
        return redirect()->back()->with('error', 'File không tồn tại.');
    }
}
