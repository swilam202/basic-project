part of 'error_handler.dart';

class ErrorMessages {
  static final String _locale = sl.get<AppLocalData>().locale;
  static String get connectionTimeout => _locale == 'ar'
      ? 'تاخير في الاتصال'
      : 'Connection timeout';

  static String get sendTimeout => _locale == 'ar'
      ? 'تاخير في الاتصال'
      : 'Connection timeout';

  static String get receiveTimeout => _locale == 'ar'
      ? 'تاخير في الاتصال'
      : 'Connection timeout';

  static String get badCertificate => _locale == 'ar'
      ? 'تاخير في الاتصال'
      : 'Connection timeout';

  static String get badResponse => _locale == 'ar'
      ? 'تاخير في الاتصال'
      : 'Connection timeout';

  static String get cancel => _locale == 'ar'
      ? 'تاخير في الاتصال'
      : 'Connection timeout';

  static String get connectionError => _locale == 'ar'
      ? 'تاخير في الاتصال'
      : 'Connection timeout';

  static String get unknown => _locale == 'ar'
      ? 'حدث خطأ'
      : 'Unknown error';
}

class ErrorCodes {
  static const int connectionTimeout = 500;
  static const int sendTimeout = 501;
  static const int receiveTimeout = 502;
  static const int badCertificate = 503;
  static const int badResponse = 504;
  static const int cancel = 505;
  static const int connectionError = 506;
  static const int unknown = 507;
}
