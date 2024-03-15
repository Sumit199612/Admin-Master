<x-auth-layout title="Admin Login">
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                <a href="../../index2.html" class="h1"><b>Admin</b> Login</a>
            </div>

            <div class="card-body">
                @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif

                @if (Session::has('success'))
                <div class="alert alert-success text-center">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                    <p>{{ Session::get('success') }}</p>
                </div>
                @endif
                <p class="login-box-msg">Sign in to start your session</p>

                <form id="quickForm" action="{{ url('admin') }}" method="post">
                    {{ csrf_field() }}

                    <?php
                    if (isset($_COOKIE["email"]) || !empty($_COOKIE["email"])) {
                        $email = $_COOKIE["email"];
                    } else {
                        $email = "";
                    }

                    if (isset($_COOKIE["password"]) || !empty($_COOKIE["password"])) {
                        $password = $_COOKIE["password"];
                    } else {
                        $password = "";
                    }

                    if (isset($_COOKIE['email'])) {
                        $remember = 'checked="checked"';
                    } else {
                        $remember = '';
                    }
                    ?>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="{{ $email }}">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" value="{{ $password }}">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="remember" name="remember" {{ $remember }}>
                                <label for="remember">
                                    Remember Me
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <!-- <div class="social-auth-links text-center mt-2 mb-3">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div> -->
                <!-- /.social-auth-links -->

                <p class="mb-1">
                    <a href="{{ url('admin/forgot-password') }}">I forgot my password</a>
                </p>
                <!-- <p class="mb-0">
                    <a href="register.html" class="text-center">Register a new membership</a>
                </p> -->
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    @section('scripts')
    <script>
        $(function() {
            $('#quickForm').validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                },
                messages: {
                    email: {
                        required: "Please enter a email address",
                        email: "Please enter a valid email address"
                    },
                    password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long"
                    },
                },
                errorElement: 'span',
                errorPlacement: function(error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.form-group').append(error);
                },
                highlight: function(element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                }
            });
        });
    </script>
    @endsection
</x-auth-layout>
