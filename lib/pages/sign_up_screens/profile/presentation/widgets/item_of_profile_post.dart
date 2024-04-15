
import 'package:cosmetologist/constants/app_images.dart';
import 'package:cosmetologist/constants/app_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemOfProfilePost extends StatelessWidget {
  const ItemOfProfilePost({super.key, this.haveIcon = false});

  final bool haveIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage(AppImages.hair1),
          fit: BoxFit.cover
        )
      ),
      child: (haveIcon) ?
      Align(
        alignment: Alignment.topRight,
        child: SvgPicture.asset(
          AppSVG.squareStackIcon,
          fit: BoxFit.scaleDown,
        ),
      ) : const SizedBox.shrink(),
    );
  }
}
