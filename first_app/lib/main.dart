import 'package:first_app/product.dart';
import 'package:first_app/product_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyListApp());
}

class EasyListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, brightness: Brightness.dark),
      home: Scaffold(
          appBar: AppBar(title: const Text('EasyList')),
          body: ProductManager("Food Tester")),
    );
  }
}
