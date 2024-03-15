<x-admin-layout title="Community">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Category</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="">Home</a></li>
                            <li class="breadcrumb-item active">Category</li>
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
                <form id="quickForm" @if(!isset($discussion) || empty($discussion)) action="{{ url('admin/discussion-create') }}" @else acion="{{ url('admin/discussion-update/'.$discussion['slug']) }}" @endif method="post" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Add Discussion</h3>
                                    <div class="card-tools">
                                        <a type="button" class="btn btn-secondary" href="{{ url('admin/discussion-index') }}">
                                            <i class="fas fa-arrow-left"></i>
                                            Return to List
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Topic</label>
                                        <input type="text" id="topic" name="topic" class="form-control" @if(isset($discussion)) value="{{ $discussion->topic }}" @else value="{{ old('topic') }}" @endif>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputContent">Content</label>
                                        <textarea id="content" name="content" class="form-control" rows="10">@if(isset($discussion)) {{ $discussion->content }} @else {{ old('content') }} @endif</textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="status" name="status" @if(isset($discussion) && $discussion['status']==1) checked @endif>
                                        <label for="status">Enable</label>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mb-2">
                            <input type="submit" @if(!isset($discussion)) value="Save" @else value="Update" @endif class="btn btn-success float-right">
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- /.content -->
    </div>

    @section('scripts')

    <script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script>
    <script src="{{ asset('assets/plugins/jquery-validation/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/jquery-validation/additional-methods.min.js') }}"></script>

    <script>
        $(function() {
            $('#quickForm').validate({
                rules: {
                    topic: {
                        required: true,
                    },
                    content: {
                        required: true,
                        max: 250
                    }
                },
                messages: {
                    topic: {
                        required: "Please enter discussion topic",
                    },
                    content: {
                        required: "Please write something about discussion",
                        max: "Write in 250 words."
                    }
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
    <script>
        ClassicEditor
            .create(document.querySelector('#content'))
            .catch(error => {
                console.error(error);
            });
    </script>

    @endsection
</x-admin-layout>
