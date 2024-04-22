
part of 'pages.dart';

class HomeFeedPage extends StatefulWidget {
  const HomeFeedPage({super.key, required this.homeFeedPageType});

  final HomeFeedPageType homeFeedPageType;

  @override
  State<HomeFeedPage> createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {

  late HomeFeedPageType homeFeedPageType;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    homeFeedPageType = widget.homeFeedPageType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:
        (homeFeedPageType.isFeed)?
        IconButton(
          onPressed: (){
            context.read<GlobalViewModel>().menuControl(open: true);
          },
          icon: const Icon(Icons.sort),
        ) : null,
        title: Text(
          homeFeedPageType.isFeed ?
          'Discovery feed' :
          'Feed' ,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){
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
                if (homeFeedPageType.isFeed)
                  const LocationItem(),
                const AddPortfolio(),
              ],
            ),
          ),
          Section(
            item: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 50),
              children: [
                PostItem(homeFeedPageType: homeFeedPageType,),
                PostItem(homeFeedPageType: homeFeedPageType,),
                PostItem(homeFeedPageType: homeFeedPageType,),
                PostItem(homeFeedPageType: homeFeedPageType,),
                PostItem(homeFeedPageType: homeFeedPageType,),
                PostItem(homeFeedPageType: homeFeedPageType,),
              ],
            ),
            child: const TabBarMenuView(),
          ),
        ],
      ),
    ).menu(context);
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
