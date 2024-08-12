import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kafaa_app/utils/api_exceptions.dart';
import 'package:kafaa_app/utils/constants.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = headers;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          debugPrint(
              'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          debugPrint(
              'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
          return handler.next(error);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _handleResponse(Future<Response> request) async {
    try {
      Response response = await request;
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        String? message = e.response!.data['message'];
        switch (e.response!.statusCode) {
          case 400:
            throw BadRequestException(message: message);
          case 401:
            throw UnauthorizedException(message: message);
          case 403:
            throw ForbiddenException(message: message);
          case 404:
            throw NotFoundException(message: message);
          case 500:
            throw ServerErrorException();
          default:
            throw ApiException();
        }
      } else if (e.type == DioExceptionType.connectionTimeout)
        throw ApiException();
      else
        throw ApiException();
    }
  }

  Future<JsonMap> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? password,
  }) async {
    final request = _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: {'password': password}),
    );
    return _handleResponse(request);
  }

  Future<JsonMap> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    String? password,
  }) async {
    final request = _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: {'password': password}),
    );
    return _handleResponse(request);
  }

  Future<JsonMap> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    String? password,
  }) async {
    final request = _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: {'password': password}),
    );
    return _handleResponse(request);
  }

  Future<JsonMap> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? password,
  }) async {
    final request = _dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(headers: {'password': password}),
    );
    return _handleResponse(request);
  }
}
