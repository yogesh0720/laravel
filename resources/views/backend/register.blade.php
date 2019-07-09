@include('layouts.header')
<div class="page-content--bge5">
    <div class="container">
        <div class="login-wrap">
            <div class="login-content">
                <div class="login-logo">
                    <a href="{{ url('admin/login') }}">
                        <img src="{{ asset('images/theme/icon/logo.png') }}" alt="CoolAdmin">
                    </a>
                </div>
                <div class="login-form">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf
                        <div class="form-group">
                            <label>{{ __('Name') }}</label>
                            <input id="name" type="text"
                                   class="form-control @error('name') is-invalid @enderror" name="name"
                                   value="{{ old('name') }}"   autocomplete="name" autofocus>

                            @error('name')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{ __('E-Mail Address') }}</label>
                            <input id="email" type="email"
                                   class="form-control @error('email') is-invalid @enderror" name="email"
                                   value="{{ old('email') }}"   autocomplete="email">

                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{ __('Password') }}</label>
                            <input id="password" type="password"
                                   class="form-control @error('password') is-invalid @enderror"
                                   name="password"   autocomplete="new-password">

                            @error('password')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>{{ __('Confirm Password') }}</label>
                            <input id="password-confirm" type="password" class="form-control"
                                   name="password_confirmation"  autocomplete="new-password">
                        </div>

                        <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">register</button>
                    </form>
                    <div class="register-link">
                        <p>
                            Already have account?
                            <a href="{{ url('admin/login') }}"> {{ __('Login') }}</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@include('layouts.footer')
