import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../infrastructure/navigation/app_pages.dart';

class FirstController {
  void onNavigateMain(BuildContext context) {
    context.pushReplacement(Routes.MAIN);
  }
}