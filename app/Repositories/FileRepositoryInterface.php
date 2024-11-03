<?php

namespace App\Repositories;

interface FileRepositoryInterface {
    public function all();
    public function file_by_user();
    public function find($id);
    public function find_name($name);
    public function create($data);
}