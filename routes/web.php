<?php

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

/*Route::get('/', function () {
    return view('welcome');
});*/

use Illuminate\Support\Facades\Auth;

Auth::routes();
#### FRONTEND #####
Route::group(['namespace' => 'Frontend'], function(){
    Route::get('/', [
        'as' => 'home',
        'uses' => 'HomeController@index'
    ]);
});


#### BACKEND #####
Route::group([/*'middleware' => ['adminMiddleware'],*/ 'namespace' => 'Backend', 'prefix' => 'admin'], function() {
    #Route::get('/login', 'LoginController@index');
    // Authentication Routes...
    Route::get('/', 'LoginController@showLoginForm')->name('login');
    Route::get('/login', 'LoginController@showLoginForm')->name('login');
    Route::post('/login', 'LoginController@login');
    Route::get('/dashboard', 'LoginController@dashboard');
    Route::get('/logout', 'LoginController@logout');
    Route::post('/logout', 'LoginController@logout');

    //admin profile
    Route::get('/userList', 'LoginController@userList');

    // Register Routes...
    Route::get('register', 'RegisterController@showRegistrationForm')->name('register');
    Route::post('register', 'RegisterController@register');
});
