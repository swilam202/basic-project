import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.darkPrimary,
    required this.background,
    required this.backgroundSoft,
    required this.backgroundSecondary,
    required this.foreground,
    required this.surfaceDark,
    required this.navyBlack,
    required this.error,
    required this.success,
    required this.warning,
    required this.info,
  });

  final Color primary;
  final Color darkPrimary;
  final Color background;
  final Color backgroundSoft;
  final Color backgroundSecondary;
  final Color foreground;
  final Color surfaceDark;
  final Color navyBlack;
  final Color error;
  final Color success;
  final Color warning;
  final Color info;

  @override
  AppColors copyWith({
    Color? primary,
    Color? darkPrimary,
    Color? background,
    Color? backgroundSoft,
    Color? backgroundSecondary,
    Color? foreground,
    Color? surfaceDark,
    Color? navyBlack,
    Color? error,
    Color? success,
    Color? warning,
    Color? info,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      darkPrimary: darkPrimary ?? this.darkPrimary,
      background: background ?? this.background,
      backgroundSoft: backgroundSoft ?? this.backgroundSoft,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      foreground: foreground ?? this.foreground,
      surfaceDark: surfaceDark ?? this.surfaceDark,
      navyBlack: navyBlack ?? this.navyBlack,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      darkPrimary: Color.lerp(darkPrimary, other.darkPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundSoft: Color.lerp(backgroundSoft, other.backgroundSoft, t)!,
      backgroundSecondary: Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      surfaceDark: Color.lerp(surfaceDark, other.surfaceDark, t)!,
      navyBlack: Color.lerp(navyBlack, other.navyBlack, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}