<?php

use App\Http\Controllers\API\User\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function() {
    Route::post('register-user', [AuthController::class, 'userRegister'])->name('register-user');
    Route::post('login-user', [AuthController::class, 'userLogin'])->name('login-user');
    Route::post('forget-password', [AuthController::class, 'forgotPassword'])->name('forget-password');
    Route::post('reset-password', [AuthController::class, 'resetPassword'])->name('reset-password');
    Route::group(['middleware' => ['auth:api']], function (): void {
        Route::post('update-profile',[AuthController::class, 'updateProfile'])->name('update-profile');
    });
});
