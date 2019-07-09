<?php


namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\User;
use Illuminate\Support\Facades\Auth;
Use Aginev\Datagrid\Datagrid;
use Illuminate\Support\Facades\Validator;

/**
 * Class LoginController
 * @package App\Http\Controllers\Backend
 * @method handle
 */
class LoginController extends Controller {

    public $successStatus = 200;


    public function login(){
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
            $user = Auth::user();
            $success['token'] =  $user->createToken('LaravelDemo')-> accessToken;
            return response()->json(['success' => $success], $this-> successStatus);
        }
        else{
            return response()->json(['error'=>'Unauthorised'], 401);
        }
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'username' => 'required|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('LaravelDemo')->accessToken;
        $success['name'] =  $user->name;
        $success['username'] =  $user->username;
        return response()->json(['success' => $success], $this->successStatus);
    }

    public function details()
    {
        $user = Auth::user();var_dump($user);die;
        return response()->json(['success' => $user], $this->successStatus);
    }
}
