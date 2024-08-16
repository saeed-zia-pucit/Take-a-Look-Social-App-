
part of 'widgets.dart';

class SelectedColors extends StatelessWidget {
  const SelectedColors({super.key, required this.colors});

  final List<ColorModel> colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colors[0].color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const Text('Natural Level '),
            Text(colors[0].name),
          ],
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colors[1].color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            // const Text('Current Color'),
            const Text('Desired Tones'),
            Text(colors[1].name),
          ],
        ),
        /*Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colors[2].color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const Text('Desired Tones'),
            Text(colors[2].name),
          ],
        ),*/
      ],
    );
  }
}
