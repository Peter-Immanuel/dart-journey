import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    // Apply home widget

    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Fooderlich",
            style: theme.textTheme.headline6,
          ),
        ),
        body: Center(
          child: Text(
            "Let's get cooking 🧑🏽‍🍳",
            style: theme.textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
