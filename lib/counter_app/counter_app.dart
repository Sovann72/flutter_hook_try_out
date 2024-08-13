import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterApp extends HookWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                // automatically triggers a rebuild of the Counter widget
                onTap: () => counter.value++,
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(counter.value.toString())
            ],
          ),
        ),
      ),
    );
  }
}
