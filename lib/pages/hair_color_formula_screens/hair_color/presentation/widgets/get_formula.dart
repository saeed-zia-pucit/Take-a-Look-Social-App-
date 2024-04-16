
import 'package:flutter/material.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/presentation/widgets/get_formula_item.dart';

class GetFormula extends StatelessWidget {
  const GetFormula({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GetFormulaItem(
            text1: 'Current Color',
            text2: 'Blonde',
            color: colors[0],
          ),
          GetFormulaItem(
            text1: 'Natural Level',
            text2: 'Lighter Blonde',
            color: colors[1],
          ),
          GetFormulaItem(
            text1: 'Desired Color',
            text2: 'Ashes',
            color: colors[2],
          ),
        ],
      ),
    );
  }
}
