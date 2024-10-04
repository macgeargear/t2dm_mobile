import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t2dm_mobile/core/theme/app_color.dart';

class AppTheme {
  static _border([Color color = AppColor.lightGrey]) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(10));

  static final lightMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.background,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(AppColor.secondary),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.background),
    textTheme: GoogleFonts.inriaSansTextTheme(),
  );
}
