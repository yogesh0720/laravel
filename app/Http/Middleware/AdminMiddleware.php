<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response;


class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @param null $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        /*if (Auth::guard($guard)->check()) {
            return redirect('/home');
        }*/

        /*if (!Auth::check()) {
            return redirect('admin/login');
        }*/

        if ($request->user() && $request->user()->type != 'admin')
        {
            //return new Response(view('backend.unauthorized')->with('role', 'admin'));
        }
        return $next($request);
    }
}
