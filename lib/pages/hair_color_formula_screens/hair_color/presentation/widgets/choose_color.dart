
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/core/extensions/number_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/presentation/widgets/color_item.dart';

import '../../view_model/hair_color_view_model.dart';

class ChooseColor extends StatelessWidget {
  const ChooseColor({super.key,
    required this.title,
    required this.colors,
    // required this.index
  });

  final String title;
  final List<Color> colors;
  // final int index;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HairColorViewModel>();

    return Container(
      height: 180.h(context),
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
            spreadRadius: 5
          )
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(title),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors.map((color) {
                return ColorItem(
                  // index: watch.currentPageIndex,
                  color: color,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
