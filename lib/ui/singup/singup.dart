import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/colors.dart';

class SingUP extends StatefulWidget {
  const SingUP({super.key});

  @override
  State<SingUP> createState() => _SingUPState();
}

class _SingUPState extends State<SingUP> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("GetStarted"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: background,
    );
  }
}