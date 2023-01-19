import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints.expand(width: 400, height: 500),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/baking-image-2.jpeg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        // child: Column(children: [
        //   // TODO: Add Aurthor's information
        //   // TODO: Add positioned texts
        // ]),
      ),
    );
  }
}
