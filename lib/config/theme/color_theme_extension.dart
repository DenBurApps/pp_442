import 'package:flutter/material.dart';

@immutable
class ColorThemeExtension extends ThemeExtension<ColorThemeExtension> {
  final Color edit;
  final Color delete;

  const ColorThemeExtension({
    required this.edit,
    required this.delete,
  });

  @override
  ColorThemeExtension copyWith({
    Color? edit,
    Color? delete,
  }) {
    return ColorThemeExtension(
      edit: edit ?? this.edit,
      delete: delete ?? this.delete,
    );
  }

  @override
  ColorThemeExtension lerp(
      ThemeExtension<ColorThemeExtension>? other, double t) {
    if (other is! ColorThemeExtension) return this;
    return ColorThemeExtension(
      edit: Color.lerp(edit, other.edit, t)!,
      delete: Color.lerp(delete, other.delete, t)!,
    );
  }

  static const instance = ColorThemeExtension(
    edit: Color(0xFFFBB142),
    delete: Color(0xFFF2263F),
  );
}
