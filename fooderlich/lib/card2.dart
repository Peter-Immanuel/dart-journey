import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'author_card.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints.expand(width: 400, height: 500),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/baking-image-2.jpeg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(children: [
              const AuthorCard(
                authorName: "Mike Kartz",
                title: "Smoothie Connoisseur",
                imageProvider: AssetImage("assets/3d_avatar_13.png"),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 16,
                        right: 16,
                        child: Text(
                          "Recipe",
                          style: FooderlichTheme.darkTextTheme.headline1,
                        )),
                    Positioned(
                        bottom: 70,
                        left: 16,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "Smoothies",
                            style: FooderlichTheme.darkTextTheme.headline1,
                          ),
                        ))
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
