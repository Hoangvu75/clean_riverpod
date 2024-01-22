import 'package:flutter/material.dart';

@immutable
class ThemeColor extends ThemeExtension<ThemeColor> {
  final Color textColor;
  final Color textButtonColor;
  final Color greyText;
  final Color appPrimaryColor;
  final Color appBgColor;
  final Color transparent;
  final Color darkGrey;
  final Color bgGradientStart;
  final Color bgGradientEnd;
  final Color primaryLinearStart;
  final Color primaryLinearEnd;
  final Color lightPrimaryLinearStart;
  final Color lightPrimaryLinearEnd;
  final List<Color> lightBtnGradient;
  final List<Color> darkBtnGradient;
  final List<Color> bottomLinearFront;
  final List<Color> bottomLinearBack;
  final Color bottomBarStroke;
  final Color white;
  final Color black;
  final Color error;
  final Color boxColor;
  final Color primaryPurple;
  final List<Color> bottomSheetLinear;

  const ThemeColor({
    required this.textColor,
    this.textButtonColor = Colors.white,
    this.greyText = const Color(0xFFA1A1A1),
    required this.appPrimaryColor,
    required this.appBgColor,
    this.transparent = Colors.transparent,
    this.darkGrey = const Color(0xFF6C6C6C),
    required this.bgGradientStart,
    required this.bgGradientEnd,
    this.primaryLinearStart = const Color(0xFF3658B1),
    this.primaryLinearEnd = const Color(0xFFC159EC),
    this.lightPrimaryLinearStart = const Color(0xFF5987FF),
    this.lightPrimaryLinearEnd = const Color(0xFFD982FF),
    this.lightBtnGradient = const [Color(0xFFC448A0), Color(0xFFD373E7)],
    this.darkBtnGradient = const [Color(0xFF653E8C), Color(0xFF6C56DA)],
    this.bottomLinearFront = const [
      Color(0xFF4C4E8A),
      Color(0xFF262C51),
    ],
    this.bottomLinearBack = const [
      Color(0xFF4C4E9E),
      Color(0xFF262C5B),
    ],
    this.bottomBarStroke = const Color(0xFF48319D),
    this.white = Colors.white,
    this.black = Colors.black,
    this.error = Colors.redAccent,
    this.boxColor = const Color(0xff4B3D60),
    this.primaryPurple = const Color(0xFF48319D),
    this.bottomSheetLinear = const [
      Color(0x992E335A),
      Color(0x991C1B33),
    ],
  });

  @override
  ThemeColor copyWith() {
    return this;
  }

  @override
  ThemeColor lerp(other, t) {
    if (other == null) return this;
    if (other is ThemeColor) {
      return ThemeColor(
        textColor: Color.lerp(textColor, other.textColor, t)!,
        greyText: Color.lerp(greyText, other.greyText, t)!,
        appPrimaryColor: Color.lerp(appPrimaryColor, other.appPrimaryColor, t)!,
        appBgColor: Color.lerp(appBgColor, other.appBgColor, t)!,
        darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
        bgGradientStart: Color.lerp(bgGradientStart, other.bgGradientStart, t)!,
        bgGradientEnd: Color.lerp(bgGradientEnd, other.bgGradientEnd, t)!,
      );
    }
    return this;
  }

  static ThemeColor light = ThemeColor(
    textColor: const Color(0xFF48319D),
    appPrimaryColor: const Color(0xFF48319D),
    appBgColor: const Color(0xFFF5F5F5),
    bgGradientStart: const Color(0xFFFFCFEF),
    bgGradientEnd: const Color(0xFFCAC9FF),
    boxColor: const Color(0xff4B3D60).withOpacity(0.5),
  );

  static ThemeColor dark = ThemeColor(
    textColor: Colors.white,
    appPrimaryColor: Colors.white,
    appBgColor: const Color(0xFF1E1E1E),
    bgGradientStart: const Color(0xFF422E5A),
    bgGradientEnd: const Color(0xFF1C1B33),
    boxColor: const Color(0xff4B3D60).withOpacity(0.3),
  );
}
