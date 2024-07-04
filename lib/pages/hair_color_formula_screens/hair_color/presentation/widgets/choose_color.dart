part of 'widgets.dart';

class ChooseColor extends StatelessWidget {
  const ChooseColor({
    super.key,
    required this.colors,
  });

  // final String title;
  final List<ColorModel> colors;

  @override
  Widget build(BuildContext context) {
    final read = context.read<HairColorViewModel>();
    return Container(
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
              spreadRadius: 5)
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(read.selectedColorName),
          if (read.currentPageIndex == 2)
           WheelPicker(
               color: HSVColor.fromColor(read.selectedColors[2].color),
               onChanged: (HSVColor color) {
                 context
                     .read<HairColorViewModel>()
                     .updateSelectedColor(2, color.toColor(), read.selectedColors);
               },
            )
          else
            Wrap(
              children: read.allColors[read.currentPageIndex]
                  .asMap()
                  .entries
                  .map((e) {
                return ColorItem(
                  index: e.key,
                  colorModel: e.value,
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
