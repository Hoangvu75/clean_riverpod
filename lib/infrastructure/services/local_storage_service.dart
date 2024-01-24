import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../core/constants/constants_export.dart';

class LocalStorageService {
  final _boxKey = KeyConstants.LOCAL_BOX_KEY;
  final _localeKey = KeyConstants.LOCALE_KEY;
  final _themeKey = KeyConstants.THEME_KEY;
  final _firstUsageKey = KeyConstants.FIRST_USAGE_KEY;
  late final Box<dynamic> _localBox;

  LocalStorageService() {
    _localBox = Hive.box<dynamic>(name: _boxKey);
  }

  void cacheLocaleString(Locale locale) {
    _localBox.put(_localeKey, locale.toString());
  }

  String? getLocaleString() => _localBox.get(_localeKey) as String?;

  void cacheThemeModeState(ThemeMode? themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        _localBox.put(_themeKey, 0);
        break;
      case ThemeMode.light:
        _localBox.put(_themeKey, 1);
        break;
      case ThemeMode.system:
        _localBox.put(_themeKey, 2);
        break;
      default:
        _localBox.put(_themeKey, 2);
        break;
    }
  }

  ThemeMode? getThemeModeState() {
    var result = _localBox.get(_themeKey) as int?;
    if (result == null) {
      return ThemeMode.system;
    }
    switch (result) {
      case 0:
        return ThemeMode.dark;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  void cacheFirstUsageState(bool isFirstUsage) {
    _localBox.put(_firstUsageKey, isFirstUsage);
  }

  bool? getFirstUsageState() {
    var result = _localBox.get(_firstUsageKey) as bool?;
    if (result == null) {
      return true;
    }
    return result;
  }
}
