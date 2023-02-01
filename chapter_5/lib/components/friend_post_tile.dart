import 'package:chapter_5/components/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/models.dart';
import '../components/components.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;

  FriendPostTile({Key? key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        const SizedBox(width: 16),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.comment),
            Text(
              '${post.timestamp} mins ago',
              style: const TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ))
      ],
    );
  }
}
