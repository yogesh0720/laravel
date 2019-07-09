<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/

#### API Development #####
Route::group(['prefix' => '/v1', 'namespace' => 'Api', 'middleware' => 'api'], function(){
    Route::post('admin/login', 'LoginController@login');
    Route::post('admin/register', 'LoginController@register');
    Route::post('admin/details', 'LoginController@details');

});
