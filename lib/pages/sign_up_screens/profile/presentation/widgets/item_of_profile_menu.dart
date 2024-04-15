
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/app_colors.dart';

class ItemOfProfileMenu extends StatelessWidget {
  const ItemOfProfileMenu({super.key,
    required this.onPressed,
    required this.text,
    this.color,
  });

  final void Function() onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.nunito(
          fontSize: 16,
          color: color ?? AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
