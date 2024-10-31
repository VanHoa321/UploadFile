<?php

namespace App\Repositories;

use App\Models\files;

class FileRepository implements FileRepositoryInterface {
    protected $model;

    public function __construct(files $file) {
        $this->model = $file;
    }

    public function all() {
        return $this->model::orderBy('id', 'desc')->get();
    }

    public function find($id) {
        return $this->model::find($id);
    }

    public function create($data) {
        return $this->model::create($data);
    }
}
