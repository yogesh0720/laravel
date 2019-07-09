<?php


namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\User;
use Illuminate\Support\Facades\Auth;
Use Aginev\Datagrid\Datagrid;

/**
 * Class LoginController
 * @package App\Http\Controllers\Backend
 * @method handle
 */
class LoginController extends Controller {

    use AuthenticatesUsers {
        login as protected customLogin;
        logout as protected customLogout;
        authenticated as protected customAuthenticated;
    }


    /**
     * @var string
     */
    protected $redirectTo = '/admin/login';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct () {
        //$this->middleware('auth');
        $this->middleware('adminMiddleware');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index () {
        return redirect('admin/login');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Http\Response
     * @throws \Illuminate\Validation\ValidationException
     */
    public function login (Request $request) {
        return $this->customLogin($request);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function logout (Request $request) {
        return $this->customLogout($request);
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function showLoginForm () {
        if (Auth::check()) {
            return redirect('admin/dashboard');
        } else {
            return view('backend.login');
        }
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function dashboard(){
        if (!Auth::check()) {
            return redirect('admin/login');
        }
        return view('backend.dashboard', [ 'currentUser' => Auth::user() ]);
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function userList (Request $request) {
        if (Auth::check()) {
            $users = User::all();
            return view('backend.admin.userList', ['users' => $users]);
        } else {
            return redirect('admin/login');
        }
    }

    public function grid_userlist(Request $request){

        // Grap all the users with their roles
        // NB!!! At the next line you are responsible for data filtration and sorting!
        $users = User::all();

        // Create Datagrid instance
        // You need to pass the users and the URL query params that the package is using
        $grid = new \Datagrid($users, $request->post('f', []));

        // Or if you do not want to use the alias
        //$grid = new \Aginev\Datagrid\Datagrid($users, Request::get('f', []));

        // Then we are starting to define columns
        $grid
            ->setColumn('name', 'Name', [
                // Will be sortable column
                'sortable'    => true,
                // Will have filter
                'has_filters' => true
            ])
            ->setColumn('email', 'Email', [
                'sortable'    => true,
                'has_filters' => true,
                // Wrapper closure will accept two params
                // $value is the actual cell value
                // $row are the all values for this row
                'wrapper'     => function ($value, $row) {
                    return '<a href="mailto:' . $value . '">' . $value . '</a>';
                }
            ])
            ->setColumn('username', 'Username', [
                'sortable'    => true,
                'has_filters' => true,
                // Define HTML attributes for this column
                'attributes'  => [
                    'class'         => 'custom-class-here',
                    'data-custom'   => 'custom-data-attribute-value',
                ],
            ])
            ->setColumn('created_at', 'Created', [
                'sortable'    => true,
                'has_filters' => true,
                'wrapper'     => function ($value, $row) {
                    // The value here is still Carbon instance, so you can format it using the Carbon methods
                    return $value;
                }
            ])
            ->setColumn('updated_at', 'Updated', [
                'sortable'    => true,
                'has_filters' => true
            ])
            // Setup action column
            ->setActionColumn([
                'wrapper' => function ($value, $row) {
                    return '<a href="'.url('admin/userList') .'" title="Edit" class="btn btn-xs"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
					<a href="" title="Delete" data-method="DELETE" class="btn btn-xs text-danger" data-confirm="Are you sure?"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>';
                }
            ]);

        // Finally pass the grid object to the view
        return view('backend.admin.userList', ['grid' => $grid]);
    }
}
