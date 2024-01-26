import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app.dart';
import '../../services/local_storage_service.dart';

part 'app_theme_mode.provider.g.dart';

@Riverpod()
class AppThemeMode extends _$AppThemeMode {
  final LocalStorageService localStorageService = App.find();

  @override
  ThemeMode build() {
    final cachedThemeMode = localStorageService.getThemeModeState();
    return cachedThemeMode ?? ThemeMode.system;
  }

  ThemeMode get themeMode => state;

  void onChangeThemeMode(ThemeMode themeMode) {
    state = themeMode;
    localStorageService.cacheThemeModeState(themeMode);
  }
}
