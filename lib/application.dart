import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/ui/app_theme_data.dart';
import 'infrastructure/navigation/app_pages.dart';
import 'infrastructure/providers/providers_export.dart';

class Application extends MaterialApp {
  const Application({super.key});

  @override
  State<Application> createState() => ApplicationState();

  static ApplicationState? of(BuildContext context) {
    return context.findAncestorStateOfType();
  }
}

class ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(context) {
    return Consumer(
      builder: (context, ref, child) {
        return MaterialApp.router(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          routerConfig: AppPages.router,
          debugShowCheckedModeBanner: false,
          themeMode: ref.watch(appThemeModeProvider),
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          builder: EasyLoading.init(
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("app in resumed");
        break;
      case AppLifecycleState.inactive:
        debugPrint("app in inactive");
        break;
      case AppLifecycleState.paused:
        debugPrint("app in paused");
        break;
      case AppLifecycleState.detached:
        debugPrint("app in detached");
        break;
      case AppLifecycleState.hidden:
        debugPrint("app in hidden");
        break;
    }
  }
}
