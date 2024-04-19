
part of 'widgets.dart';

class ChooseColor extends StatelessWidget {
  const ChooseColor({super.key,
    required this.title,
    required this.colors,
    // required this.index
  });

  final String title;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h(context),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 5),
            blurRadius: 50,
            spreadRadius: 5
          )
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(title),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors.map((color) {
                return ColorItem(
                  // index: watch.currentPageIndex,
                  color: color,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
