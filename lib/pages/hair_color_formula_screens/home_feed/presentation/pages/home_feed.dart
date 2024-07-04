part of 'pages.dart';

class HomeFeedPage extends StatefulWidget {
  const HomeFeedPage({super.key, required this.homeFeedPageType});

  final HomeFeedPageType homeFeedPageType;

  @override
  State<HomeFeedPage> createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  late HomeFeedPageType homeFeedPageType;

  late Future<List<PostModel>> futurePosts;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    homeFeedPageType = widget.homeFeedPageType;
    try {
      setupGetIt();
      futurePosts = getIt<FeedRepoImpl>().getFeed(0, 100);
    } catch (e) {
      print(e);
    }

    super.initState();
  }

  void setupGetIt() {
    if (!getIt.isRegistered<FeedRepoImpl>()) {
      getIt.registerLazySingleton<FeedRepoImpl>(() => FeedRepoImpl(Dio()));
    }

    if (!getIt.isRegistered<FeedViewModel>()) {
      getIt.registerLazySingleton<FeedViewModel>(
          () => FeedViewModel(getIt<FeedRepoImpl>()));
    }
    // Register other dependencies...
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: (homeFeedPageType.isFeed)
                  ? IconButton(
                      onPressed: () {
                        context.read<GlobalViewModel>().menuControl(open: true);
                      },
                      icon: const Icon(Icons.sort),
                    )
                  : null,
              title: Text(
                homeFeedPageType.isFeed ? 'Discovery feed' : 'Feed',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<FollowViewModel>().onTapSearch();
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    context.push(RouteNames.notification);
                  },
                  icon: SvgPicture.asset(AppIcons.notificationIcon),
                ),
              ],
            ),
            body: CustomScrollView(
              slivers: [
                Section(
                  child: Column(
                    children: [
                      if (homeFeedPageType.isFeed) const LocationItem(),
                      AddPortfolio(onSuccess: updatePosts),
                    ],
                  ),
                ),
                Section(
                  item: FutureBuilder<List<PostModel>>(
                    future: futurePosts,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                        ;
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final post = snapshot.data![index];
                              return PostItem(
                                homeFeedPageType: homeFeedPageType,
                                post: post,
                              );
                            },
                            childCount: snapshot.data!.length,
                          ),
                        );
                      }
                    },
                  ),
                  child: const TabBarMenuView(),
                ),

                /*Section(
                item: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 50),
                  children: [
                    PostItem(homeFeedPageType: homeFeedPageType,),
                  ],
                ),
                child: const TabBarMenuView(),
              ),*/
              ],
            ),
          ).menu(context),
          if (context.watch<FollowViewModel>().showSearch) const SearchUsers(),
        ],
      );
    } catch (e) {
      print(e);
      return const SizedBox.shrink();
    }
  }

  void updatePosts() {
    futurePosts = getIt<FeedRepoImpl>().getFeed(0, 100);
    setState(() {});
  }
}

class Section extends MultiSliver {
  Section({
    super.key,
    required Widget child,
    Widget? item,
  }) : super(
          pushPinnedChildren: true,
          children: [
            SliverPinnedHeader(
              child: child,
            ),
            item ?? const SizedBox.shrink(),
          ],
        );
}

enum HomeFeedPageType {
  feed,
  home,
}

extension HomeFeedPageTypeExtension on HomeFeedPageType {
  bool get isFeed => HomeFeedPageType.feed == this;

  bool get isHome => HomeFeedPageType.home == this;
}
