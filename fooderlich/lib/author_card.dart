import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard(
      {required this.authorName, required this.title, this.imageProvider});

  @override
  State<StatefulWidget> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  // final String authorName;
  // final String title;
  // final ImageProvider? imageProvider;

  // const _AuthorCard(
  //     {
  //     required this.authorName,
  //     required this.title,
  //     this.imageProvider});

  bool _isFavourited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleImage(
              imageProvider: widget.imageProvider,
              imageRadius: 28,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.authorName,
                  style: FooderlichTheme.darkTextTheme.headline2,
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.title,
                  style: FooderlichTheme.darkTextTheme.headline3,
                )
              ],
            ),
          ],
        ),
        IconButton(
            icon: Icon(_isFavourited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
            onPressed: () {
              setState(() {
                _isFavourited = !_isFavourited;
              });
              // const snackBar = SnackBar(content: Text("Favourite pressed!"));
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }),
      ]),
    );
  }
}
