<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;

trait ApiResponser
{
    protected function successResponse($message = null, $data = NULL, $code = 200, $token = null): JsonResponse
    {
        if (isset($data->id)) {
            //for add/update
            return response()->json([

                'message' => $message,
                'request_items' => [
                    'id' => $data->id,
                ],
                'status' => 'success',
            ], $code);
        } else {
            //for get/view
            return response()->json([
                'message' => $message,
                'data' => $data,
                'status' => 'success',
            ], $code);
        }
    }

    protected function errorResponse($message = null, $errors = [], $code = null): JsonResponse
    {
        return response()->json([
            "status" => "fail",
            'message' => $message,
            'errors' => $errors,
            'code' => $code,
        ], $code);
    }

    protected function getSingleResponse($message = null, $data = NULL, $code = 200, $token = null): JsonResponse
    {
        return response()->json([
            'message' => $message,
            'data' => $data,
            'status' => 'success',
        ], $code);
    }
}
