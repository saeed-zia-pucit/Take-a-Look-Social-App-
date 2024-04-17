
import 'package:flutter/material.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/follow_following/presentation/widgets/user_item.dart';

class FollowFollowingPage extends StatefulWidget {
  const FollowFollowingPage({super.key, required this.followFollowingPageType});

  final FollowFollowingPageType followFollowingPageType;

  @override
  State<FollowFollowingPage> createState() => _FollowFollowingPageState();
}

class _FollowFollowingPageState extends State<FollowFollowingPage> {

  late FollowFollowingPageType followFollowingPageType;

  @override
  void initState() {
    followFollowingPageType = widget.followFollowingPageType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (followFollowingPageType.isFollowers) ?
          'Followers' : 'Followings',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text('5022 following'),
            ),
            UserItem(
              followFollowingPageType: followFollowingPageType,
            ),
            UserItem(
              followFollowingPageType: followFollowingPageType,
            ),
            UserItem(
              followFollowingPageType: followFollowingPageType,
            ),
            UserItem(
              followFollowingPageType: followFollowingPageType,
            ),

          ],
        ),
      ),
    );
  }
}

enum FollowFollowingPageType {
  followers,
  following,
}

extension FollowFollowingPageTypeExtension on FollowFollowingPageType {
  bool get isFollowers => FollowFollowingPageType.followers == this;
  bool get isFollowing => FollowFollowingPageType.following == this;
}
