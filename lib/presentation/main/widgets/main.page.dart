import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/context.extension.dart';
import '../controllers/main.controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) => Text(
            titleText(ref),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        actions: [
          // change theme mode button
          Consumer(
            builder: (context, ref, child) => IconButton(
              onPressed: () => onChangeThemeMode(ref),
              icon: child!,
            ),
            child: const Icon(Icons.brightness_4),
          ),
          IconButton(
            onPressed: () => onChangeLocale(context),
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) => randomActivity(ref).when(
                  skipLoadingOnRefresh: false,
                  data: (data) {
                    return Column(
                      children: [
                        Text(
                          data.activity.toString(),
                          style: context.textStyle.H4,
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
              Consumer(
                builder: (context, ref, child) => btcValues(ref).when(
                  skipLoadingOnRefresh: false,
                  data: (data) {
                    return Column(
                      children: data
                          .map((e) =>
                              Text(e, style: const TextStyle(fontSize: 20)))
                          .toList(),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => Text(error.toString()),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onNavigateFirst(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
