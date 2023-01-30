import 'package:chaper3/models/app_state_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  final _appStateManager = AppStateManager();
  runApp(Fooderlich(
    appStateManager: _appStateManager,
  ));
}

class Fooderlich extends StatefulWidget {
  AppStateManager appStateManager;

  Fooderlich({super.key, required this.appStateManager});
  @override
  State<StatefulWidget> createState() {
    return FooderlichState();
  }
}

class FooderlichState extends State<Fooderlich> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
