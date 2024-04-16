
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/view_model/hair_color_view_model.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key,
    required this.color,
    this.label,
    // required this.index,
  });

  // final int index;
  final Color color;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final read = context.read<HairColorViewModel>();
    final watch = context.watch<HairColorViewModel>();
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
