import 'package:flutter/material.dart';

@immutable
class ColorThemeExtension extends ThemeExtension<ColorThemeExtension> {
  final Color primary;
  final Color edit;
  final Color delete;

  const ColorThemeExtension({
    required this.primary,
    required this.edit,
    required this.delete,
  });

  @override
  ColorThemeExtension copyWith({
    Color? primary,
    Color? edit,
    Color? delete,
  }) {
    return ColorThemeExtension(
      primary: primary ?? this.primary,
      edit: edit ?? this.edit,
      delete: delete ?? this.delete,
    );
  }

  @override
  ColorThemeExtension lerp(
      ThemeExtension<ColorThemeExtension>? other, double t) {
    if (other is! ColorThemeExtension) return this;
    return ColorThemeExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      edit: Color.lerp(edit, other.edit, t)!,
      delete: Color.lerp(delete, other.delete, t)!,
    );
  }

  static const instance = ColorThemeExtension(
    primary: Color(0xFF4E2FA9),
    edit: Color(0xFFFBB142),
    delete: Color(0xFFF2263F),
  );
}
