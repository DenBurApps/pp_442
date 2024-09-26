import 'package:flutter/material.dart';
import 'package:pp_442/config/theme/color_theme_extension.dart';
import 'package:pp_442/config/theme/text_theme_extension.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF4E2FA9),
          secondary: Color(0xFFFF6F37),
          surface: Color(0xFFD9D9D9),
          onSurface: Color(0xFF4E2FA9),
          onSurfaceVariant: Color(0xFF24252A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        extensions: [
          ColorThemeExtension.instance,
          TextThemeExtension.instance,
        ],
      );
}
