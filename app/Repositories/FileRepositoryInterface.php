<?php

namespace App\Repositories;

interface FileRepositoryInterface {
    public function all();
    public function find($id);
    public function create($data);
}