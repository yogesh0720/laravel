<?php


namespace App\Http\Controllers\Backend;


use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

/**
 * Class RegisterController
 * @package App\Http\Controllers\Backend
 */
class RegisterController extends Controller {

    use RegistersUsers {
        register as customRegister;
    }

    protected $redirectTo = '/admin/login';

    /*public function __construct()
    {
        $this->middleware('guest');
    }*/

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function showRegistrationForm() {
        return view('backend.register');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request) {
        return $this->customRegister($request);
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'username' => $data['username'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'type' => User::DEFAULT_TYPE,
        ]);
    }

}
