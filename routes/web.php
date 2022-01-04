<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\SslCommerzPaymentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


Route::get('/sym', function () {
    return view('symlinkexample');
});

Route::get('/clear', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    return "Cleared!";
});

Route::get('/cache', function () {
    Artisan::call('route:cache');
    Artisan::call('view:cache');
    return "cache!";
});


// front end routes


Route::get('/', 'forntendController@home')->name('home');
Route::get('/about', 'forntendController@about')->name('about');
Route::get('/services', 'forntendController@services')->name('service');
Route::get('/gallery', 'forntendController@gallery')->name('gallery');
Route::get('/contact', 'forntendController@contact')->name('contact');
Route::get('/donate/{id}', 'HomeController@donate')->name('donate');
Route::post('/donate/{id}', 'HomeController@submit_donation')->name('donate.submit');
Route::get('/transactions', 'HomeController@transactions')->name('transactions');




// SSLCOMMERZ Start
Route::get('/example1', [SslCommerzPaymentController::class, 'exampleEasyCheckout']);
Route::get('/example2', [SslCommerzPaymentController::class, 'exampleHostedCheckout']);

Route::post('/pay', [SslCommerzPaymentController::class, 'index']);
Route::post('/pay-via-ajax', [SslCommerzPaymentController::class, 'payViaAjax']);

Route::post('/success', [SslCommerzPaymentController::class, 'success']);
Route::post('/fail', [SslCommerzPaymentController::class, 'fail']);
Route::post('/cancel', [SslCommerzPaymentController::class, 'cancel']);

Route::post('/ipn', [SslCommerzPaymentController::class, 'ipn']);
//SSLCOMMERZ END