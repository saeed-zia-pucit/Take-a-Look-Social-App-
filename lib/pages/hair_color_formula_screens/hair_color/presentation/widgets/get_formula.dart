
part of 'widgets.dart';

class GetFormula extends StatelessWidget {
  const GetFormula({super.key, required this.colors});

  final List<ColorModel> colors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GetFormulaItem(
            text1: 'Current Color',
            text2: colors[0].name,
            color: colors[0].color,
          ),
          GetFormulaItem(
            text1: 'Natural Level',
            text2: colors[1].name,
            color: colors[1].color,
          ),
          GetFormulaItem(
            text1: 'Desired Tone',
            text2: colors[2].name,
            color: colors[2].color,
          ),
        ],
      ),
    );
  }
}
