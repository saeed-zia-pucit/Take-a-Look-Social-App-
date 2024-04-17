
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_icons.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home/presentation/widgets/add_portfolio.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home/presentation/widgets/location_view.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home/presentation/widgets/post_item.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home/presentation/widgets/tab_bar_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // late TabController tabController;
  //
  // @override
  // void initState() {
  //   tabController = TabController(vsync: this, length: 3);
  //
  //   // tabController = TabController(vsync: this, length: 3);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.sort),
        ),
        title: const Text(
          'Discovery feed'
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(AppIcons.notificationIcon),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          Section(
            child: Column(
              children: [
                LocationItem(),
                AddPortfolio(),
              ],
            ),
          ),
          Section(
            item: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 50),
              children: [
                PostItem(),
                PostItem(),
                PostItem(),
                PostItem(),
                PostItem(),
                PostItem(),
                PostItem(),
                PostItem(),
                PostItem(),
                PostItem(),
              ],
            ),
            child: const TabBarMenuView(),
          ),
        ],
      ),
    );
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
