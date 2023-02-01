import 'package:chapter_5/fooderlich_theme.dart';
import 'package:flutter/widgets.dart';
import '../models/models.dart';
import '../components/components.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FriendPostListView({Key? key, required this.friendPosts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Social Chefs 🧑‍🍳",
              style: FooderlichTheme.lightTextTheme.headline1,
            ),
            const SizedBox(height: 16),
            ListView.separated(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final post = friendPosts[index];
                  return FriendPostTile(post: post);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemCount: friendPosts.length),
            const SizedBox(height: 16),
          ],
        ));
  }
}
