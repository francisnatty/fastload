import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastload/global/global_variables.dart';

class ApiResponse<T> {
  T? data;
  String? statusCode;
  bool? success;
  String? statusMessage;
  ApiResponse({
    this.data,
    this.statusCode,
    this.success,
    this.statusMessage,
  });
  @override
  String toString() {
    return 'ApiResponse<$T>{data: $data,statusCode: $statusCode,success: $success,statusMessage: $statusCode}';
  }

  factory ApiResponse.fromError(String message, String statusCode) {
    return ApiResponse(
        success: false, statusCode: statusCode, statusMessage: message);
  }
}

//object to handle list of data

abstract class ApiClient {
  Future<ApiResponse<T>> request<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? payload,
    T Function(Map<String, dynamic> json)? fromJson,
    bool? showLoader,
  });
  void setToken(String token);
  void removeToken();
  String handleException(Exception exception);
}

enum MethodType { get, post, put, delete, patch }

class DioClient implements ApiClient {
  late Dio _client;

  DioClient() {
    _client = Dio()..options.baseUrl = 'https://sandbox.vtpass.com/api';

    // ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    //   options.queryParameters['api_key'] = 'your-api-key';
    //   return handler.next(options);
    // }));
  }
  @override
  void removeToken() {
    _client.options.headers.remove('Authorization');
  }

  @override
  void setToken(String token) {
    _client.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  String handleException(Exception exception) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<T>> request<T>(
      {required String path,
      required MethodType method,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? payload,
      T Function(Map<String, dynamic> json)? fromJson,
      bool? showLoader}) async {
    ApiResponse<T> apiResponse;
    Response response;
    try {
      switch (method) {
        case MethodType.get:
          response = await _client.get(path,
              data: payload,
              queryParameters: queryParameters,
              options: Options(headers: getHeaders));
          break;
        case MethodType.post:
          response = await _client.post(path,
              data: payload,
              queryParameters: queryParameters,
              options: Options(headers: postheaders));
          break;
        case MethodType.put:
          response = await _client.put(path,
              data: payload, queryParameters: queryParameters);
          break;
        case MethodType.delete:
          response = await _client.delete(path,
              data: payload, queryParameters: queryParameters);
          break;
        case MethodType.patch:
          response = await _client.patch(path,
              data: payload, queryParameters: queryParameters);
          break;
      }
      apiResponse = ApiResponse(
          data: fromJson?.call(response.data),
          statusCode: response.statusCode.toString(),
          success: true);
    } on DioException catch (e) {
      apiResponse = ApiResponse<T>.fromError(
        (e.response?.data['status_message'] ?? e.message).toString(),
        (e.response?.data?['status_code'] ?? e.response?.statusCode).toString(),
      );
    }
    log(apiResponse.toString(), name: 'api_response');
    return apiResponse;
  }
}
