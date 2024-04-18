
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/constants/app_icons.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/core/extensions/widget_extension.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/core/view_model/global_view_model.dart';

import '../widgets/add_portfolio.dart';
import '../widgets/location_view.dart';
import '../widgets/post_item.dart';
import '../widgets/tab_bar_view.dart';

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
    homeFeedPageType = widget.homeFeedPageType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            context.read<GlobalViewModel>().menuControl(open: true);
          },
          icon: const Icon(Icons.sort),
        ),
        title: Text(
          homeFeedPageType.isHome ?
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
                if (homeFeedPageType.isHome)
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
  home,
  feed,
}

extension HomeFeedPageTypeExtension on HomeFeedPageType {
  bool get isHome => HomeFeedPageType.home == this;
  bool get isFeed => HomeFeedPageType.feed == this;
}
