import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/app_local_data.dart';
import '../../core/di/service_locator.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial(sl.get<AppLocalData>().locale)) {
    _initializeLocale();
  }

  void _initializeLocale() {
    final savedLocale = sl.get<AppLocalData>().locale;
    emit(LocaleChanged(savedLocale));
  }

  void changeLocale(String languageCode) {
    sl.get<AppLocalData>().locale = languageCode;
    emit(LocaleChanged(languageCode));
  }

  void toggleLocale() {
    final currentLocale = sl.get<AppLocalData>().locale;
    final newLocale = currentLocale == 'en' ? 'ar' : 'en';
    sl.get<AppLocalData>().locale = newLocale;
    emit(LocaleChanged(newLocale));
  }


}
