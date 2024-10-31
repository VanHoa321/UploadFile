<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class files extends Model
{
    use HasFactory;
    protected $fillable = [ 
        "file_name",
        "file_path",
        "file_type",
        "file_size"
    ];
    protected $primaryKey = "id";
    protected $table = "files";
    public $timestamps = false;
}
