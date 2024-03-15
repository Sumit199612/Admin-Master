<!DOCTYPE html>
<html lang="en">
    <head>
        @include('partials.auth.head', ['title' => $attributes['title']])
    </head>
    <body class="hold-transition login-page">
        <main>
            {{ $slot }}
        </main>
        @include('partials.auth.foot')
    </body>
</html>
