
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
    final read = context.read<HairColorViewModel>();
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
          // Center(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: colors.length,
          //     itemBuilder: (context, index) {
          //       return ColorItem(
          //         index: index,
          //         color: colors[index],
          //       );
          //     },
          //   ),
          // ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: read.allColors[read.currentPageIndex].asMap().entries.map((e) {
                return ColorItem(
                  index:e.key,
                  color: e.value,
                );
              }).toList(),
            ),
          ),

          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: colors.map((color) {
          //       return ColorItem(
          //         index: colors.indexOf(color),
          //         color: color,
          //       );
          //     }).toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
