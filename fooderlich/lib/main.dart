import 'package:flutter/material.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // create Theme
    // Apply home widget

    return MaterialApp(
      title: 'Fooderlich',

      // Add theme
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Fooderlich"),
        ),
        body: const Center(
          child: Text("Let's get cooking 🧑🏽‍🍳"),
        ),
      ),
    );
  }
}
