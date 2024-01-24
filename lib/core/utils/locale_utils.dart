import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../infrastructure/services/local_storage_service.dart';

class LocaleUtils {
  LocaleUtils._();

  static final appLocale = _AppLocale();

  static LocaleData get currentLocaleData {
    var locale = Platform.localeName.toLocale();
    var localeData = appLocale.supportedLocales.entries.firstWhere(
      (localeData) {
        return localeData.value.locale == locale;
      },
    ).value;
    return localeData;
  }

  static void changeLocale({
    required BuildContext context,
    required Locale locale,
  }) {
    if (context.locale == locale) return;
    context.setLocale(locale);
    App.find<LocalStorageService>().cacheLocaleString(locale);
  }

  static Locale? stringToLocale(String? localeString) {
    if (localeString == null) return null;
    var localeList = localeString.split('_');
    return Locale(localeList[0], localeList[1]);
  }
}

class _AppLocale {
  _AppLocale();

  final en_US = const LocaleData(
    locale: Locale("en", "US"),
    language: "English",
  );

  final vi_VN = const LocaleData(
    locale: Locale("vi", "VN"),
    language: "Tiếng Việt",
  );

  final ja_JP = const LocaleData(
    locale: Locale("ja", "JP"),
    language: "日本語",
  );

  late final supportedLocales = {
    0: en_US,
    1: vi_VN,
    2: ja_JP,
  };
}

class LocaleData {
  final Locale locale;
  final String language;

  const LocaleData({
    required this.locale,
    required this.language,
  });
}
