import 'constants.dart';
import 'storage_services.dart';

class AppLocalData {
  static String? _token;
  static String _locale = Constants.defaultLanguage;

  String? get token => _token;

  String get locale => _locale;

  bool get isAuthenticated => _token != null && _token!.isNotEmpty;

  set token(String? value) {
    if (value != null) {
      _token = value;
      SecureStorage.write('token', value);
    }
  }

  set locale(String? value) {
    if (value != null) {
      _locale = value;
      SecureStorage.write('locale', value);
    }
  }

  Future<void> readFromStorage() async {
    _token = await SecureStorage.read('token');
    _locale = await SecureStorage.read('locale') ?? Constants.defaultLanguage;
  }

  Map<String, dynamic> toJson() {
    return {'token': _token, 'locale': _locale};
  }
}
