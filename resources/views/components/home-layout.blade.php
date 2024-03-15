<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        @include('partials.user.head', ['title' => $attributes['title']])
    </head>
    <body>
        <div class="relative sm:flex sm:justify-center sm:items-center min-h-screen bg-dots-darker bg-center bg-gray-100 dark:bg-dots-lighter dark:bg-gray-900 selection:bg-red-500 selection:text-white">
            <div class="max-w-7xl mx-auto p-6 lg:p-8">
                @include('partials.user.header')
                {{ $slot }}
                @include('partials.user.footer')
            </div>
        </div>
        @include('partials.user.foot')
    </body>
</html>
