import 'package:flutter/material.dart';

const _fontFamily = 'Roboto';

@immutable
class ThemeText extends ThemeExtension<ThemeText> {
  final TextStyle H1;
  final TextStyle H2;
  final TextStyle H3;
  final TextStyle H4;
  final TextStyle Title;
  final TextStyle Body;
  final TextStyle Label;
  final TextStyle Caption;

  const ThemeText({
    required this.H1,
    required this.H2,
    required this.H3,
    required this.H4,
    required this.Title,
    required this.Body,
    required this.Label,
    required this.Caption,
  });

  @override
  ThemeText copyWith() {
    return this;
  }

  @override
  ThemeText lerp(other, t) {
    return this;
  }

  static const instance = ThemeText(
    H1: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 34,
      height: 1.5,
      fontWeight: FontWeight.bold,
    ),
    H2: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 26,
      height: 1.5,
      fontWeight: FontWeight.bold,
    ),
    H3: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      height: 1.5,
      fontWeight: FontWeight.bold,
    ),
    H4: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      height: 1.5,
    ),
    Title: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w500,
    ),
    Body: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 1.5,
    ),
    Label: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 13,
      height: 1.5,
    ),
    Caption: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.5,
    ),
  );
}
