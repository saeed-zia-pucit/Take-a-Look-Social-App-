
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/number_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/view_model/hair_color_view_model.dart';

import '../pages/hair_color_page.dart';
import 'choose_color.dart';

class ShowColor extends StatelessWidget {
  const ShowColor({super.key,
    required this.title,
    required this.chooseColorTitle,
    required this.hairColorPageType,
    required this.selectedColor,
  });

  final String title;
  final String chooseColorTitle;
  final HairColorPageType hairColorPageType;
  final Color selectedColor;


  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HairColorViewModel>();
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                if (hairColorPageType.index != 0)
                TextButton(
                  onPressed: (){},
                  child: const Text('View level'),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 110.h(context)),
                color: selectedColor,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ChooseColor(
            title: chooseColorTitle,
            colors:
            (hairColorPageType.isPrimaryColor) ?
            watch.primaryColors :
            (hairColorPageType.isNaturalLevel) ?
            watch.naturalLevelColors :
            watch.desiredColors,
            // index: hairColorPageType.index,
          ),
        ),
      ],
    );
  }
}
