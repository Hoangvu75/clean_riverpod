import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_mode.provider.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode{
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  ThemeMode get themeMode => state;

  void onChangeThemeMode(ThemeMode themeMode) {
    state = themeMode;
  }
}
