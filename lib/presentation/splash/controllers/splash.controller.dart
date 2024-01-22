import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../../../infrastructure/navigation/app_pages.dart';

class SplashController with WidgetsBindingObserver {
  void onGoMain(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
      context.pushReplacement(Routes.MAIN);
    });
  }
}
