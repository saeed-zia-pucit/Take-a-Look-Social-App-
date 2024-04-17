
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';

class SlidableDeleteButton extends StatelessWidget {
  const SlidableDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Slidable.of(context)!.close();
      },
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SvgPicture.asset(
          AppIcons.trashBasketIcon,
          colorFilter: ColorFilter.mode(
            AppColors.whiteColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
