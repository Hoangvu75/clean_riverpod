import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/models/activity/activity.dart';
import '../../../infrastructure/providers/providers_export.dart';
import '../../../infrastructure/utils/locale_utils.dart';

class MainController {
  AsyncValue<Activity> randomActivity(WidgetRef ref) {
    final activity = ref.watch(getActivityProvider);
    return activity;
  }

  void onChangeThemeMode(WidgetRef ref) {
    final appThemeMode = ref.read(appThemeModeProvider.notifier);
    appThemeMode.onChangeThemeMode(
      appThemeMode.themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    );
  }

  void onChangeLocale(BuildContext context) {
    context.setLocale(
      context.locale == LocaleUtils.appLocale.en_US.locale
          ? LocaleUtils.appLocale.vi_VN.locale
          : LocaleUtils.appLocale.en_US.locale,
    );
  }
}
