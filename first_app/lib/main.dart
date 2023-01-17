import 'package:first_app/product.dart';
import 'package:first_app/product_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EasyListApp());
}

class EasyListApp extends StatefulWidget {
  const EasyListApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _EasyListAppState();
  }
}

class _EasyListAppState extends State<EasyListApp> {
  final List<String> _products = ["Food Tester"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('EasyList'),
          ),
          body: ProductManager()),
    );
  }
}
