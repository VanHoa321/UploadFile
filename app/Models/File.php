<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class File extends Model
{
    use HasFactory;
    protected $fillable = [ 
        "file_name",
        "file_path",
        "file_type",
        "file_size",
        "expiration_time",
        "user_id"
    ];
    protected $primaryKey = "id";
    protected $table = "files";
    public $timestamps = false;
}
