import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/usecase/iusecase.dart';
import '../../../core/utils/locale_utils.dart';
import '../../../domain/entities/models/activity/activity.dart';
import '../../../domain/usecases/get_btc_stream.usecase.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../infrastructure/providers/providers_export.dart';

class MainController {
  AsyncValue<Activity> randomActivity(WidgetRef ref) {
    return ref.watch(getActivityProvider);
  }

  void onChangeThemeMode(WidgetRef ref) {
    final appThemeMode = ref.read(appThemeModeProvider.notifier);
    appThemeMode.onChangeThemeMode(
      appThemeMode.themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    );
    return ref.refresh(getActivityProvider);
  }

  void onChangeLocale(BuildContext context) {
    LocaleUtils.changeLocale(
      context: context,
      locale: context.locale == LocaleUtils.appLocale.en_US.locale
          ? LocaleUtils.appLocale.vi_VN.locale
          : LocaleUtils.appLocale.en_US.locale,
    );
  }

  String titleText(WidgetRef ref) {
    switch (ref.watch(appThemeModeProvider)) {
      case ThemeMode.dark:
        return LocaleKeys.general_dark.tr();
      default:
        return LocaleKeys.general_light.tr();
    }
  }

  List<String> btcValues(WidgetRef ref) {
    return ref.watch(btcValuesProvider);
  }
}
