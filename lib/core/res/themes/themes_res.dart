import 'package:flutter/material.dart';

import '../colors/light_colors.dart';



class ThemesRes {
  static ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Color(0xff202020),
    ),
    extensions: [lightColors],
  );
}
}