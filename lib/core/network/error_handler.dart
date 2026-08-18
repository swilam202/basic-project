import 'package:basic_project/core/data/app_local_data.dart';
import 'package:basic_project/core/di/service_locator.dart';
import 'package:basic_project/core/network/failure.dart';
import 'package:dio/dio.dart';

part 'error_constants.dart';

abstract class ErrorHandler {
  static Failure handle(dynamic e) {
    if (e is DioException) {
      return _handleDioExceptions(e);
    } else {
      return Failure(ErrorCodes.unknown, e.toString());
    }
  }

  static Failure _handleDioExceptions(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(
          ErrorCodes.connectionTimeout,
          ErrorMessages.connectionTimeout,
        );
      case DioExceptionType.sendTimeout:
        return Failure(ErrorCodes.sendTimeout, ErrorMessages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return Failure(ErrorCodes.receiveTimeout, ErrorMessages.receiveTimeout);
      case DioExceptionType.badCertificate:
        return Failure(ErrorCodes.badCertificate, ErrorMessages.badCertificate);
      case DioExceptionType.badResponse:
        return _handleRequestException(dioException.response);
      case DioExceptionType.cancel:
        return Failure(ErrorCodes.cancel, ErrorMessages.cancel);
      case DioExceptionType.connectionError:
        return Failure(
          ErrorCodes.connectionError,
          ErrorMessages.connectionError,
        );
      case DioExceptionType.unknown:
        return Failure(ErrorCodes.unknown, ErrorMessages.unknown);
    }
  }

  static Failure _handleRequestException(Response? response) {
    if (response?.data != null && response?.data is Map) {
      return Failure.fromJson(response!.data);
    } else if (response?.data != null && response?.data is String) {
      return Failure(ErrorCodes.badResponse, response?.data);
    } else {
      return Failure(ErrorCodes.badResponse, ErrorMessages.badResponse);
    }
  }
}
