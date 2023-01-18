import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  final String category = "Editor's Choice";
  final String title = "The Art of Dough";
  final String description = "Learn to make perfect bread";
  final String chef = "Ray Wenderlich";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        constraints: const BoxConstraints.expand(
          width: 400,
          height: 500,
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/baking-image-1.jpeg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Stack(
          children: [
            Text(
              category,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
              top: 20,
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headline2,
              ),
            ),
            Positioned(
                bottom: 40,
                right: 0,
                child: Text(
                  description,
                  style: FooderlichTheme.darkTextTheme.bodyText1,
                )),
            Positioned(
              bottom: 15,
              right: 0,
              child: Text(
                chef,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
