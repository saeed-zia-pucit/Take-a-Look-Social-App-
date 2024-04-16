
import 'package:flutter/cupertino.dart';

class GetFormulaItem extends StatelessWidget {
  const GetFormulaItem({super.key, required this.color, required this.text1, required this.text2});

  final String text1;
  final String text2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
              Text(text2),
            ],
          ),
        ),
        Container(
          height: 150,
          color: color,
        )
      ],
    );
  }
}
