<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{ env('APP_NAME') }} | {{ $title }}</title>
<meta name="csrf-token" content="{{ csrf_token() }}" />

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="{{ asset('adminAssets/plugins/fontawesome-free/css/all.min.css') }}">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="{{ asset('adminAssets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
<!-- Theme style -->
<link rel="stylesheet" href="{{ asset('adminAssets/dist/css/adminlte.min.css') }}">
<!-- icheck bootstrap -->
<link rel="stylesheet" href="{{ asset('adminAssets/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
<link rel="stylesheet" href="{{ asset('adminAssets/plugins/summernote/summernote-bs4.min.css') }}">
<!-- summernote -->
<link rel="stylesheet" href="{{ asset('adminAssets/plugins/summernote/summernote-bs4.min.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@yield('styles')
