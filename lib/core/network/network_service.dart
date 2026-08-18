import 'package:basic_project/core/network/network_constants.dart';
import 'package:dio/dio.dart';

import '../data/constants.dart';
import 'interceptor_services.dart';

class ApiService {
  late final Dio _dio;

  final Map<String, dynamic> _headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };


  ApiService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      connectTimeout: Duration(seconds: Constants.timeoutSeconds),
      receiveTimeout: Duration(seconds: Constants.timeoutSeconds),
      headers: _headers,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.addAll(InterceptorServices.interceptors);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio.get(path, queryParameters: queryParameters, data: body);
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio.post(path, queryParameters: queryParameters, data: body);
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio.put(path, queryParameters: queryParameters, data: body);
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio.delete(path, queryParameters: queryParameters, data: body);
  }
}
