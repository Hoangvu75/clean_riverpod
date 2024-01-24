import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'core/ui/app_theme_data.dart';
import 'data/source/sources_export.dart';
import 'domain/repositories/repositories_export.dart';
import 'infrastructure/navigation/app_pages.dart';
import 'infrastructure/providers/providers_export.dart';
import 'infrastructure/services/services_export.dart';

class App extends MaterialApp {
  const App({super.key});

  @override
  State<App> createState() => AppState();

  static AppState? of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  static void lazyPut<T extends Object>(T instance) {
    if (!GetIt.I.isRegistered<T>()) {
      GetIt.I.registerLazySingleton<T>(() => instance);
      debugPrint("[GetIt] Register $T");
    }
  }

  static void put<T extends Object>(T instance) {
    if (!GetIt.I.isRegistered<T>()) {
      GetIt.I.registerSingleton<T>(instance);
      debugPrint("[GetIt] Register $T");
    }
  }

  static T find<T extends Object>() {
    return GetIt.I.get<T>();
  }
}

class AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    registerSingletonInstance();
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
      builder: (context, ref, child) => MaterialApp.router(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        routerConfig: AppPages.router,
        debugShowCheckedModeBanner: false,
        themeMode: ref.watch(appThemeModeProvider),
        theme: AppThemeData.lightTheme,
        darkTheme: AppThemeData.darkTheme,
        builder: EasyLoading.init(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          ),
        ),
      ),
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

  void registerSingletonInstance() {
    // services
    App.lazyPut(LocalStorageService());

    // api clients
    App.lazyPut(ActivityApiClient());

    // socket
    App.lazyPut(CoinSocket());

    // repositories
    App.lazyPut(ActivityRepository(apiClient: App.find<ActivityApiClient>()));
  }
}
