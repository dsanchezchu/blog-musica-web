<?php

use App\Http\Controllers\ForumController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// User
Route::get('/users', [UserController::class, 'index']);
Route::get('/forum', [ForumController::class, 'index']);
Route::get('/register', [RegisterController::class,'register']);
// Roles
// Route::get('roles', RoleController::class);

