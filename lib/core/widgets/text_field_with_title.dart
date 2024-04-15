
import '/constants/app_colors.dart';
import '/core/extensions/number_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({super.key,
    required this.title,
    this.titleColor,
    this.obscureText,
    this.suffixIcon,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.maxLines = 1,
  });

  final String title;
  final Color? titleColor;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 14.h(context),
            color: titleColor ?? AppColors.whiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(5),
        SizedBox(
          height: maxLines == null ? 50.h(context) : null,
          child: Center(
            child: TextField(
              style: textStyle ?? GoogleFonts.nunito(fontSize: 12.h(context),),
              obscureText: obscureText ?? false,
              // minLines: 1,
              maxLines: maxLines,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                hintText: hintText,
                hintStyle: hintStyle,
                fillColor: AppColors.whiteColor,
                suffixIcon: suffixIcon ?? const SizedBox.shrink(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: .5,
                    // color: AppColors.borderColor,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: .5,
                    color: AppColors.borderColor,
                    // color: AppColors.primaryColor,
                    // color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
