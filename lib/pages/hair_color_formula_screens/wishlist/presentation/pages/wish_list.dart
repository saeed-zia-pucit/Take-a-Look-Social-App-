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
  late UserModel userDataModel;
  bool isLoading = false;

  @override
  void initState() {
    try {
      pageType = widget.pageType;
      if (pageType.wishlist) {
        fetchDraft();
      } else {
        fetchSavePost();
      }
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  Future<void> fetchDraft() async {
    setState(() => isLoading = true);
    futurePostsNotifier = ValueNotifier<List<PostModel>>([]);
    await getIt<FeedRepoImpl>().getDraft(0, 500).then((posts) async {
      allPosts = posts;
      userDataModel = await getIt<ProfileRepo>().get_User();
      try {
        if (userDataModel.id!.isEmpty) {
          userDataModel = await getIt<ProfileRepo>().get_User();
        }
      } catch (e) {
        userDataModel = await getIt<ProfileRepo>().get_User();
        print(e);
      }
      futurePostsNotifier.value = allPosts; // Update the notifier
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $error')),
      );
    }).whenComplete(() => setState(() => isLoading = false));
  }

  Future<void> fetchSavePost() async {
    setState(() => isLoading = true);
    futurePostsNotifier = ValueNotifier<List<PostModel>>([]);
    await getIt<FeedRepoImpl>().getSavedPost(0, 500).then((posts) async {
      allPosts = posts;
      userDataModel = await getIt<ProfileRepo>().get_User();
      futurePostsNotifier.value = allPosts; // Update the notifier
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $error')),
      );
    }).whenComplete(() => setState(() => isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    try {
      // Return the Scaffold widget
      return Stack(
        children: [
          if (isLoading) ...[
            Scaffold(
              backgroundColor: AppColors.whiteColor,
              // Add the AppBar widget
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  pageType.wishlist ? 'Wishlist' : 'Saved Post',
                ),
              ),
              body: const Center(child: CircularProgressIndicator()),
            )
          ] else ...[
            Scaffold(
              backgroundColor: AppColors.whiteColor,
              // Add the AppBar widget
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  pageType.wishlist ? 'Wishlist' : 'Saved Post',
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
                              //  // This triggers a rebuild after the delay
                              if (post != null) {
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
        ],
      );
    } catch (e) {
      print(e);
      return const SizedBox.shrink();
    }
  }

  void updatePosts() {
    if (pageType.wishlist) {
      fetchDraft();
    } else {
      fetchSavePost();
    }
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
