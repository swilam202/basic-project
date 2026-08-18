part of 'locale_cubit.dart';

abstract class LocaleState {}

class LocaleInitial extends LocaleState {
  final String locale;
  LocaleInitial(this.locale);
}

class LocaleChanged extends LocaleState {
  final String locale;
  LocaleChanged(this.locale);
}
