import 'package:flutter/material.dart';
import 'package:pp_442/config/theme/color_theme_extension.dart';
import 'package:pp_442/config/theme/text_theme_extension.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);

  TextThemeExtension get text => _theme.extension<TextThemeExtension>()!;

  Color get scaffoldBackgroundColor => _theme.scaffoldBackgroundColor;

  ColorScheme get colors => _theme.colorScheme;

  ColorThemeExtension get customColors =>
      _theme.extension<ColorThemeExtension>()!;
}
