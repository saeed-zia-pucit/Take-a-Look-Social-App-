
part of 'pages.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text('5022 following'),
            ),
            UserItem(),
            UserItem(),
            UserItem(),
            UserItem(),

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
