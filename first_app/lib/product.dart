import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final List<String> products;
  Product(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: products
            .map((element) => Card(
                    child: Column(children: <Widget>[
                  Image.asset('assets/food_image_1.jpeg'),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Text(element),
                  )
                ])))
            .toList());
  }
}
