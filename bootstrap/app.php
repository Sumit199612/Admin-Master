<?php

use Illuminate\Foundation\Application;

use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;


use App\Traits\ApiResponser;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Exception\InvalidArgumentException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        api: __DIR__ . '/../routes/api.php',
        web: __DIR__ . '/../routes/web.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
            'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
            'permission' => \App\Http\Middleware\PermissionMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        ApiResponser::class;

        $exceptions->dontReport([
            AccessDeniedHttpException::class,
        ]);

        $exceptions->render(function (MethodNotAllowedHttpException $exception, Request $request) : Response|JsonResponse|\Symfony\Component\HttpFoundation\Response {
            if ($request->is('api/*')) {
                return $this->errorResponse('The specified method for the request is invalid', [0 => [
                    'message' => 'Please try with other request type (POST, PUT, GET, DELETE).',
                    'fieldName' => 'API',
                    'errors' => $exception->getMessage(),
                ]], 405);
            }

            return response()->view('error', ['error' => $exception, 'status' => $exception->getStatusCode() ,'message' => 'The specified method for the request is invalid']);
        });

        $exceptions->render(function (NotFoundHttpException $exception, Request $request){
            if ($request->is('api/*')) {
                return $this->errorResponse('The specified URL cannot be found', [0 => [
                    'message' => 'The API endpoint is invalid.',
                    'fieldName' => 'endpoint',
                    'errors' => $exception->getMessage(),
                ]], 404);
            }

            return response()->view('error', ['error' => $exception, 'status' => $exception->getStatusCode(), 'message' => '']);
        });

        $exceptions->render(function (HttpException $exception, Request $request){
            if ($request->is('api/*')) {
                return $this->errorResponse('Unauthorized action', [0 => [
                    'message' => 'The authenticated user is not allowed to access the specified API endpoint.',
                    'fieldName' => 'role',
                    'errors' => $exception->getMessage(),
                ]], $exception->getStatusCode());
            }

            return response()->view('error', ['error' => $exception, 'status' => $exception->getStatusCode(), 'message' => 'The authenticated user is not allowed to access']);
        });

        $exceptions->render(function (AuthenticationException $exception, Request $request){
            if ($request->is('api/*')) {
                return $this->errorResponse('Unauthorized action', [0 => [
                    'message' => 'The authenticated user is not allowed to access the specified API endpoint.',
                    'fieldName' => 'role',
                    'errors' => $exception->getMessage(),
                ]], $exception->getStatusCode());
            }

            return response()->view('error', ['error' => $exception, 'status' => $exception->getStatusCode(), 'message' => 'The authenticated user is not allowed to access']);
        });

        $exceptions->render(function (ModelNotFoundException $exception, Request $request){
            $trim = explode('/', Request::getPathInfo());

            if ($request->is('api/*')) {
                return $this->errorResponse('No ' . $trim[3] . ' Data Found', [0 => [
                    'message' => 'The ' . $trim[3] . ' is not found',
                    'fieldName' => 'id',
                    'errors' => $exception->getMessage(),
                ]], 404);
            }

            return response()->view('error', ['error' => $exception, 'status' => 404, 'message' => ""]);
        });

        $exceptions->render(function (ValidationException $exception, Request $request){
            $error = [];

            if ($request->is('api/*')) {
                foreach ($exception->errors() as $key => $value) {
                    $error = array_merge($error, $value);
                }

                return $this->errorResponse('These fields are required', $error, (isset($error[0]['fieldName']) && $error[0]['fieldName'] == "email,password") ? 401 : $exception->status);
            }
        });

        $exceptions->render(function (QueryException $exception, Request $request){
            if ($request->is('api/*')) {
                return $this->errorResponse('Database Query Error', [0 => [
                    'message' => 'Invalid SQL format or Table field or Type',
                    'fieldName' => 'database',
                    'errors' => $exception->getMessage(),
                ]], 502);
            }

            return response()->view('error', ['error' => $exception, 'status' => 502, 'message' => "Invalid SQL format or Table field or Type"]);
        });

        $exceptions->render(function (InvalidArgumentException $exception, Request $request){
            if ($request->is('api/*')) {
                return $this->errorResponse('Error', $exception->getMessage(), $exception->getCode());
            }

            return response()->view('error', ['error' => $exception, 'status' => $exception->getCode(), 'message' => $exception->getMessage()]);
        });

        $exceptions->render(function (AccessDeniedHttpException $exception, Request $request){
            if ($request->is('api/*')) {
                return $this->errorResponse('Error', $exception->getMessage(), $exception->getCode());
            }

            return response()->view('error', ['error' => $exception, 'status' => $exception->getCode(), 'message' => $exception->getMessage()]);
        });

        $exceptions->report(function (Request $request, Exceptions $exception){
            if (config('app.debug')) {
                return parent::render($request, $exception);
            }

            if ($request->is('api/*')) {
                return $this->errorResponse('Unexpected Exception. Try later', $exception->getTrace(), $exception->getCode());
            }

            return response()->view('error', ['error' => $exception, 'status' => $exception->getCode(), 'message' => $exception->getTrace()]);
        });

    })->create();
