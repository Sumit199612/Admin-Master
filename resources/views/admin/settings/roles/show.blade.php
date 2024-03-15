<x-admin-layout title="Roles">
    @section('styles')
    <link rel="stylesheet" href="{{ asset('adminAssets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('adminAssets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('adminAssets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">
    @endsection

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Role</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Role</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif

                <!-- @if(session()->has('success'))
                <div class="alert alert-success">
                    {{ session()->get('success') }}
                </div>
                @endif -->
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Role List</h3>
                                <div class="card-tools">
                                    <a type="button" href="{{ route('roles.create') }}" class="btn btn-secondary">
                                        <i class="nav-icon fas fa-plus"></i>
                                        Add Role
                                    </a>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="bg-light p-4 rounded">
                                    <h1>{{ ucfirst($role->name) }} Role</h1>
                                    <div class="lead">

                                    </div>

                                    <div class="container mt-4">

                                        <h3>Assigned permissions</h3>

                                        <table class="table table-striped">
                                            <thead>
                                                <th scope="col" width="20%">Name</th>
                                                <th scope="col" width="1%">Guard</th>
                                            </thead>

                                            @foreach($rolePermissions as $permission)
                                            <tr>
                                                <td>{{ $permission->name }}</td>
                                                <td>{{ $permission->guard_name }}</td>
                                            </tr>
                                            @endforeach
                                        </table>
                                    </div>

                                </div>
                                <div class="mt-4">
                                    <a href="{{ route('roles.edit', $role->id) }}" class="btn btn-info">Edit</a>
                                    <a href="{{ route('roles.index') }}" class="btn btn-default">Back</a>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

    @section('scripts')

    <script>

    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <!-- <script>
        @if(Session::has('success'))
        toastr.options = {
            "closeButton": true,
            "progressBar": true
        }
        toastr.success("{{ session('success') }}");
        @endif
    </script> -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    @endsection
</x-admin-layout>
