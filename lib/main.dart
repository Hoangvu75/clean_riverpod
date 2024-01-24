import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/constants/constants_export.dart';
import 'core/utils/locale_utils.dart';
import 'generated/assets.dart';

Future<void> main() async {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: Assets.envApi);

  runApp(
    EasyLocalization(
      supportedLocales: List.generate(
        LocaleUtils.appLocale.supportedLocales.length,
        (index) => LocaleUtils.appLocale.supportedLocales[index]!.locale,
      ),
      path: GeneralConstants.translationPath,
      saveLocale: false,
      fallbackLocale: LocaleUtils.appLocale.en_US.locale,
      child: const ProviderScope(
        child: App(),
      ),
    ),
  );
}
