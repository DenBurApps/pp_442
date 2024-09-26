import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;

  const TextThemeExtension({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
  });

  @override
  TextThemeExtension copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
  }) {
    return TextThemeExtension(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
    );
  }

  @override
  TextThemeExtension lerp(ThemeExtension<TextThemeExtension>? other, double t) {
    if (other is! TextThemeExtension) {
      return this;
    }
    return TextThemeExtension(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
    );
  }

  static final instance = TextThemeExtension(
    displayLarge: GoogleFonts.quicksand(
      fontSize: 40,
      height: 1.1,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: GoogleFonts.quicksand(
      fontSize: 30,
      height: 1.1,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: GoogleFonts.quicksand(
      fontSize: 20,
      height: 1.1,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: GoogleFonts.quicksand(
      fontSize: 20,
      height: 1.1,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: GoogleFonts.quicksand(
      fontSize: 18,
      height: 1.1,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: GoogleFonts.quattrocentoSans(
      fontSize: 16,
      height: 1.1,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: GoogleFonts.quattrocentoSans(
      fontSize: 12,
      height: 1.1,
      fontWeight: FontWeight.w700,
    ),
  );
}
