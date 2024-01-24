import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app.dart';
import '../../../core/utils/locale_utils.dart';
import '../../../infrastructure/navigation/app_pages.dart';
import '../../../infrastructure/services/local_storage_service.dart';

class SplashController with WidgetsBindingObserver {
  final LocalStorageService localStorageService = App.find();

  void onGoMain(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cachedLocaleString = localStorageService.getLocaleString();
      final cachedLocale = LocaleUtils.stringToLocale(cachedLocaleString);
      if (cachedLocale != null) {
        LocaleUtils.changeLocale(context: context, locale: cachedLocale);
      }
      FlutterNativeSplash.remove();
      context.pushReplacement(Routes.MAIN);
    });
  }
}
