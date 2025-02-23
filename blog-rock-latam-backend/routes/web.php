<?php

use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// User
Route::get('/users', [UserController::class, 'index']);

// Roles
// Route::get('roles', RoleController::class);

