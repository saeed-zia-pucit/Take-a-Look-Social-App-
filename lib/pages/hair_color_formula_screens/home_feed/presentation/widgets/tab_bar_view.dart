part of 'widgets.dart';

class TabBarMenuView extends StatelessWidget {
  final Function(String) onTabSelected; // Callback function property

  TabBarMenuView({Key? key, required this.onTabSelected}) : super(key: key);

  List<String> categories = ["Other", "Brunet", "Blonde", "Red", "Black"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Container(
        height: 100,
        color: AppColors.whiteColor,
        child: TabBar(
          onTap: (index) {
            onTabSelected(
                categories[index]); // Call the callback when a tab is tapped
          },
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
              icon: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(251, 231, 227, 1),
                ),
                child: Image.asset(
                  AppIcons.tabBarOther,
                  height: 40,
                ),
              ),
              text: categories[0],
            ),
            Tab(
              icon: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(251, 231, 227, 1),
                ),
                child: Image.asset(
                  AppIcons.tabBar1,
                  height: 40,
                ),
              ),
              text: categories[1],
            ),
            Tab(
              icon: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(251, 231, 227, 1),
                ),
                child: Image.asset(
                  AppIcons.tabBar2,
                  height: 40,
                ),
              ),
              text: categories[2],
            ),
            Tab(
              icon: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(251, 231, 227, 1),
                ),
                child: Image.asset(
                  AppIcons.tabBar3,
                  height: 40,
                ),
              ),
              text: categories[3],
            ),
            Tab(
              icon: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(251, 231, 227, 1),
                ),
                child: Image.asset(
                  AppIcons.tabBar5,
                  height: 40,
                ),
              ),
              text: categories[4],
            ),
          ],
        ),
      ),
    );
  }
}
