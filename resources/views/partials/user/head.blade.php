<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSRF Token -->
<meta name="csrf-token" content="{{ csrf_token() }}">

<title>{{env('APP_NAME')}} @if ($title)| {{ $title }} @endif</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="{{ asset('assets/img/favicon.png') }}" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.bunny.net">
<link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />

@yield('styles')
