
part of 'widgets.dart';

class TabBarMenuView extends StatelessWidget {
  const TabBarMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Container(
        height: 100,
        color: AppColors.whiteColor,
        child: TabBar(
          labelStyle: TextStyle(
            fontSize: 12,
            color: AppColors.primaryColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            color: AppColors.greyColor,
          ),
          tabs: [
            Tab(
              icon: Column(
                children: [
                  Image.asset(
                    AppIcons.tabBar1,
                    height: 40,
                  ),
                ],
              ),
              text: 'All',
            ),
            Tab(
              icon: Image.asset(
                AppIcons.tabBar2,
                height: 40,
              ),
              text: 'Curly',
            ),
            Tab(
              icon: Image.asset(
                AppIcons.tabBar3,
                height: 40,
              ),
              text: 'Highlight',
            ),
            Tab(
              icon: Image.asset(
                AppIcons.tabBar4,
                height: 40,
              ),
              text: 'Blonde',
            ),
            Tab(
              icon: Image.asset(
                AppIcons.tabBar5,
                height: 40,
              ),
              text: 'Burnett ',
            ),
          ],
        ),
      ),
    );
  }
}
