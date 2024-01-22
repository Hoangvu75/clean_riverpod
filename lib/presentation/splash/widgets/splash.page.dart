import 'package:flutter/material.dart';

import '../controllers/splash.controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = SplashController();

  @override
  void initState() {
    _controller.onGoMain(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
