import 'package:flutter/material.dart';

import '../controllers/first.controller.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _controller = FirstController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: const Center(
        child: Text('First Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.onNavigateMain(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
