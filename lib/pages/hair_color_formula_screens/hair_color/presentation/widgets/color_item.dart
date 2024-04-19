
part of 'widgets.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key,
    required this.color,
    this.label,
  });

  final Color color;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final read = context.read<HairColorViewModel>();
    return GestureDetector(
      onTap: () {
        read.onTapColorItem(read.currentPageIndex, color);
      },
      child: SizedBox(
        height: 40,
        width: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
