import 'package:flutter/material.dart';
import 'package:flutter_hook_try_out/counter_app/counter_app.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterApp(),
    );
  }
}
