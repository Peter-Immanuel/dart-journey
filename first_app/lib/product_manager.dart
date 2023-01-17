import 'package:flutter/material.dart';
import 'product.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ["Food Tester"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _products.add("New Product");
                });
              },
              child: const Text("Add Product"),
            )),
        Product(_products)
      ],
    );
  }
}
