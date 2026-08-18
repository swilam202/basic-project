import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/app_local_data.dart';
import '../di/service_locator.dart';

class InterceptorServices {

  static Interceptor? get _loggerInteceptor {
   if (kDebugMode) {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    );
  }else{
    return null;
  }
}

  static final Interceptor authInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) {
        final String? token = sl.get<AppLocalData>().token;
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    );

  
  static List<Interceptor> get interceptors => [
    ?_loggerInteceptor,
    authInterceptor,
  ];
}
