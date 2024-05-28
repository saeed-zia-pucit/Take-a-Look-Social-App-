
part of 'pages.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key, required this.followPageType});

  final FollowPageType followPageType;

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {

  late FollowPageType followPageType;

  @override
  void initState() {
    followPageType = widget.followPageType;
    context.read<FollowViewModel>().init(followPageType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FollowViewModel>(
      builder: (context, viewModel, _) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(
                  (followPageType.isFollowers) ?
                  'Followers' : 'Followings',
                ),
              ),
              body: PagedListView<int, UserModel>(
                pagingController: viewModel.pagingController,
                builderDelegate: PagedChildBuilderDelegate<UserModel>(
                  itemBuilder: (context, item, index) => UserItem(
                    userModel: item,
                  ),
                ),
              ),
              // body: const SingleChildScrollView(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //         child: Text('5022 following'),
              //       ),
              //       UserItem(),
              //       UserItem(),
              //       UserItem(),
              //       UserItem(),
              //
              //     ],
              //   ),
              // ),
            ),
            if (viewModel.showSearch)
            const SearchUsers(),
          ],
        );
      }
    );
  }
}

enum FollowPageType {
  followers,
  following,
}

extension FollowFollowingPageTypeExtension on FollowPageType {
  bool get isFollowers => FollowPageType.followers == this;
  bool get isFollowing => FollowPageType.following == this;
}
