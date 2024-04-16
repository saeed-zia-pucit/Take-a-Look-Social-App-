
import 'package:flutter/material.dart';

class SelectedColors extends StatelessWidget {
  const SelectedColors({super.key, required this.colors});

  final List<Color> colors;

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
                color: colors[0],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text('Current Color'),
            Text('Blonde'),
          ],
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colors[1],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text('Natural Level '),
            Text('Lighter Blonde | 08'),
          ],
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colors[2],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text('Desired Color'),
            Text('Ashes'),
          ],
        ),
      ],
    );
  }
}
