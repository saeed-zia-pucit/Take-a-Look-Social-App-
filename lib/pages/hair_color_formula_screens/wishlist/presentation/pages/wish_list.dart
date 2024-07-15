part of 'pages.dart';

class WishListPostPage extends StatefulWidget {
  const WishListPostPage({super.key, required this.pageType});

  final WishListPageType pageType;

  @override
  State<WishListPostPage> createState() => _WishListPostPageState();
}

class _WishListPostPageState extends State<WishListPostPage> {
  late WishListPageType pageType;

  late ValueNotifier<List<PostModel>> futurePostsNotifier;
  List<PostModel> allPosts = [];
  late Future<UserModel> userModel;
  late UserModel userDataModel;

  @override
  void initState() {
    try {
      pageType = widget.pageType;
      fetchPosts();
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  // Fetch the posts
  Future<void> fetchPosts() async {
    futurePostsNotifier = ValueNotifier<List<PostModel>>([]);
    await getIt<FeedRepoImpl>().getFeed(0, 500).then((posts) {
      allPosts = posts;
      futurePostsNotifier.value = allPosts; // Update the notifier
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      // Return the Scaffold widget
      return Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.whiteColor,
            // Add the AppBar widget
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                pageType!.wishlist ? 'Wishlist' : 'Saved Post',
              ),
            ),
            body: CustomScrollView(
              slivers: [
                Section(
                  item: ValueListenableBuilder<List<PostModel>>(
                    valueListenable: futurePostsNotifier,
                    builder: (context, value, child) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final post = value[index];
                            if (userDataModel.id!.isEmpty) {
                              Future.delayed(Duration(seconds: 2), () {
                                fetchPosts();
                              });
                            }
                            //  // This triggers a rebuild after the delay
                            if (post != null) {
                              if (userDataModel.id!.isEmpty) {
                                Future.delayed(Duration(seconds: 2), () {
                                  // fetchPosts();
                                });
                                userDataModel =
                                    AppLocalData.getUserModel as UserModel;
                              }
                              return PostItem(
                                homeFeedPageType: pageType.wishlist
                                    ? HomeFeedPageType.feed
                                    : HomeFeedPageType.feed,
                                post: post,
                                userModel: userDataModel,
                                onPostDeleted: () {
                                  updatePosts();
                                },
                              );
                            }
                            if (post == null) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50.0),
                                child: Center(
                                  child: Text('No data found'),
                                ),
                              );
                            }
                            return null;
                          },
                          childCount: value.length,
                        ),
                      );
                    },
                  ),
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          )
        ],
      );
    } catch (e) {
      print(e);
      return const SizedBox.shrink();
    }
  }

  void updatePosts() {
    fetchPosts();
    setState(() {});
  }
}

enum WishListPageType {
  wishlist,
  save,
}

extension WishListPageTypeExtension on WishListPageType {
  bool get wishlist => WishListPageType.wishlist == this;

  bool get save => WishListPageType.save == this;
}
