
import 'package:gap/gap.dart';

import '/core/extensions/context_extension.dart';
import '/core/extensions/number_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key,
    required this.title,
    required this.content1,
    this.content2,
    this.topPadding = false,
    this.titleColor,
    this.content1Color,
    this.content2Color,
  });

  final String title;
  final String content1;
  final String? content2;
  final bool topPadding;
  final Color? titleColor;
  final Color? content1Color;
  final Color? content2Color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          (topPadding) ? context.statusBarHeightGap : const SizedBox.shrink(),
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 20,
              color: titleColor ?? AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(10),
          Text.rich(
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 14.h(context),
              color: content1Color ?? AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
            TextSpan(
              children: [
                TextSpan(
                  text: content1,
                ),
                TextSpan(
                  text: content2 ?? '',
                  style: GoogleFonts.nunito(
                    fontSize: 14.h(context),
                    color: content2Color ?? AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  )
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}