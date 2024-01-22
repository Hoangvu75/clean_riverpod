import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'application.dart';
import 'infrastructure/utils/locale_utils.dart';

Future<void> main() async {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: List.generate(
        LocaleUtils.appLocale.supportedLocales.length,
            (index) {
          return LocaleUtils.appLocale.supportedLocales[index]!.locale;
        },
      ),
      path: 'assets/translations',
      saveLocale: false,
      fallbackLocale: LocaleUtils.appLocale.en_US.locale,
      child: const ProviderScope(
        child: Application(),
      )
    ),
  );
}
