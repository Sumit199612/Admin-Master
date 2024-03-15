<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    @include('partials.user.head', ['title' => $attributes['title']])
</head>

<body>

    <body style="background: dimgray;">
        <div class="container mt-5" style="background-color: lightslategray; max-width:fit-content;">
            @include('partials.user.header')
            {{ $slot }}
            @include('partials.user.footer')
        </div>
        </div>
        @include('partials.user.foot')
    </body>

</html>
