part of 'pages.dart';

class HomeFeedPage extends StatefulWidget {
  const HomeFeedPage({super.key, required this.homeFeedPageType});

  final HomeFeedPageType homeFeedPageType;

  @override
  State<HomeFeedPage> createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  late HomeFeedPageType homeFeedPageType;

  late ValueNotifier<List<PostModel>> futurePostsNotifier;
  List<PostModel> allPosts = [];
  late Future<UserModel> userModel;
  late UserModel userDataModel;
  late FirebaseMessaging messaging;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    homeFeedPageType = widget.homeFeedPageType;
    try {
      setupGetIt();
      userModel = getIt<ProfileRepo>().get_User();
      AppLocalData.getUserModel.then((userModel){
        userDataModel = userModel!;
      });
      // Call the fetchPosts method when the widget is initialized
      fetchPosts();
    } catch (e) {
      print(e);
    }

    getFcmToken();
    super.initState();
  }

  getFcmToken() async {
    // Initialize the Firebase Messaging instance
    messaging = FirebaseMessaging.instance;
    // Get the token
    var fcmToken = await messaging.getToken();
    pushFcmToken(fcmToken.toString());
    //2 second delay
  }

  Future<void> pushFcmToken(String fcmToken) async {
    await AppLocalData.updateToken();
    final token = await AppLocalData.getUserToken;
    final url = Uri.parse('${AppLocalData.BaseURL}/notifications/token');
    final response = await http.put(
      url,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'token': fcmToken}),
    );

    if (response.statusCode == 200) {
      await Future.delayed(const Duration(seconds: 4));
      // Subscribe to the topic
      await messaging.subscribeToTopic(userDataModel.id!);
      requestPermission();
      listenToMessages();
      print('FCM Token pushed successfully.');
    } else {
      print('Failed to push FCM Token. Status code: ${response.statusCode}');
    }
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void listenToMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });
  }

  // Fetch the posts
  Future<void> fetchPosts() async {
    futurePostsNotifier = ValueNotifier<List<PostModel>>([]);
    await getIt<FeedRepoImpl>().getFeed(0, 500).then((posts) {
      allPosts = posts;
      futurePostsNotifier.value = allPosts; // Update the notifier
      sortData("Other");
    });
  }

  // Setup the GetIt instance
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
      // Return the Scaffold widget
      return Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.whiteColor,
            // Add the AppBar widget
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
                      //if (homeFeedPageType.isFeed) const LocationItem(),
                      FutureBuilder<UserModel>(
                        future: userModel,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              userDataModel = snapshot.data!;
                              AppLocalData.saveUserModel(userDataModel);
                              return AddPortfolio(
                                onSuccess: updatePosts,
                                userModel: snapshot
                                    .data!, // Use the UserModel data here
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                          }
                          // Show a loading spinner or another placeholder widget while waiting
                          return const CircularProgressIndicator();
                        },
                      )
                    ],
                  ),
                ),
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

                              // AppLocalData.getUserModel.then((userModel){
                              //   userDataModel = userModel!;
                              // });
                              if (userDataModel.id!.isEmpty) {
                                print('ttttttttttttttttttttttt');
                                Future.delayed(Duration(seconds: 2), () {
                                  // fetchPosts();
                                });

                              }
                              if (userDataModel.id!.isEmpty) {
                                Future.delayed(Duration(seconds: 2), () {
                                  fetchPosts();
                                });
                              }
                              return PostItem(
                                homeFeedPageType: homeFeedPageType,
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
                  child: TabBarMenuView(onTabSelected: _onTabSelected),
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

  void _onTabSelected(String category) {
    // Handle the tab selection event here
    print("Selected tab : $category");
    sortData(category); // Call the sortData method with the selected category
  }

  void sortData(String category) {
    List<PostModel> filteredPosts;
    if (category == "All") {
      filteredPosts = allPosts;
    } else {
      filteredPosts = allPosts
          .where(
              (post){
                print(post.category.toLowerCase());
                return  post.category.toLowerCase() == category.toLowerCase();
              })
          .toList();
    }
    futurePostsNotifier.value = filteredPosts; // Update the notifier
  }

  void updatePosts() {
    fetchPosts();
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
