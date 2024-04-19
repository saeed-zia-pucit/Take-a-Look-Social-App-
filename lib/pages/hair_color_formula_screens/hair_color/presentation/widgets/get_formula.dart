
part of 'widgets.dart';

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
