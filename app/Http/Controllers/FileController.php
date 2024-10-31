<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
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
                // Tạo tên file mới nếu đã tồn tại
                $originalFileName = $uploadedFile->getClientOriginalName();
                $fileName = pathinfo($originalFileName, PATHINFO_FILENAME);
                $fileExtension = $uploadedFile->getClientOriginalExtension();
                $newFileName = $originalFileName;
    
                // Kiểm tra xem tên file đã tồn tại chưa
                $existingFile = $this->fileRepository->find_name($originalFileName);
                if ($existingFile) {
                    // Nếu đã tồn tại, có thể thêm timestamp hoặc số ngẫu nhiên vào tên
                    $newFileName = $fileName . '_' . time() . '.' . $fileExtension;
                }
    
                $fileData = [
                    'file_name' => $newFileName,
                    'file_path' => 'public/img/' . $newFileName,
                    'file_type' => $uploadedFile->getClientMimeType(),
                    'file_size' => $uploadedFile->getSize(),
                ];
    
                $fileRecord = $this->fileRepository->create($fileData);
                $uploadedFile->move(public_path('img'), $newFileName);
                $downloadLinks[] = url('http://127.0.0.1:8000/download/' . $fileRecord->id);
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
