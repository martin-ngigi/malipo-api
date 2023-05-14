<?php

use App\Http\Controllers\MpesaController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//      /v1
Route::group(['prefix' => '/v1'], function () {
    //      /api/v1/mpesa
    Route::group(['prefix'=>'/mpesa'], function() {
        //      /api/v1/mpesa/generate-access-token
        Route::get('/generate-access-token', [MpesaController::class, 'generateAccessToken']);
        Route::post('/simulate-stk-push', [MpesaController::class, 'simulateSTKPush']);
        Route::post('/query-trsansaction', [MpesaController::class, 'queryTransaction']);
        Route::get('/test', [MpesaController::class, 'testMethod']);

    });

    //  /api/v1/confirm-m-payments
    Route::post('/confirm-m-payments', [MpesaController::class, 'confirmCallbackMpesaPayments']);


});

