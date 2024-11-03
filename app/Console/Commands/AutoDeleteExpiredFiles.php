<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\File;

class AutoDeleteExpiredFiles extends Command
{
    protected $signature = 'files:auto-delete';
    protected $description = 'Delete files that have expired';

    public function handle()
    {
        $expiredFiles = File::where('expiration_time', '<', now()->timezone('Asia/Ho_Chi_Minh'))->get();

        foreach ($expiredFiles as $file) {

            if (file_exists(public_path($file->file_path))) {
                unlink(public_path($file->file_path));
                $this->info("Đã xóa file khỏi thư mục: {$file->file_name}");
            } else {
                $this->info("Không tìm thấy path của file: {$file->file_name}");
            }

            $file->delete();
            $this->info("Đã xóa: {$file->file_name}");
        }

        $this->info('Đã xóa những file hết hạn!');
    }
}
