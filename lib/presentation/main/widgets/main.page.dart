import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/locale_keys.g.dart';
import '../controllers/main.controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController _controller = MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.general_dark.tr(),
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          // change theme mode button
          Consumer(
            builder: (context, ref, child) => IconButton(
              onPressed: () => _controller.onChangeThemeMode(ref),
              icon: child!,
            ),
            child: const Icon(Icons.brightness_4),
          ),
          // change locale button
          IconButton(
            onPressed: () => _controller.onChangeLocale(context),
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) =>
              _controller.randomActivity(ref).when(
                    skipLoadingOnRefresh: false,
                    data: (data) {
                      return Column(
                        children: [
                          Text(
                            data.activity.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            data.type.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            data.participants.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            data.price.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            data.link.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            data.key.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) => Text(error.toString()),
                  ),
        ),
      ),
    );
  }
}
