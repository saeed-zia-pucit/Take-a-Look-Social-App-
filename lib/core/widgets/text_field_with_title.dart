
import 'package:flutter/cupertino.dart';

import '/constants/app_colors.dart';
import '/core/extensions/number_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWithTitle extends StatefulWidget {
  const TextFieldWithTitle({super.key,
    required this.title,
    this.titleColor,
    this.obscureText = false,
    this.suffixIcon,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.maxLines = 1,
  });

  final String title;
  final Color? titleColor;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;

  @override
  State<TextFieldWithTitle> createState() => _TextFieldWithTitleState();
}

class _TextFieldWithTitleState extends State<TextFieldWithTitle> {

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.nunito(
            fontSize: 14.h(context),
            color: widget.titleColor ?? AppColors.whiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(5),
        SizedBox(
          height: widget.maxLines == null ? 50.h(context) : null,
          child: Center(
            child: TextField(
              style: widget.textStyle ?? GoogleFonts.nunito(fontSize: 12.h(context),),
              obscureText: (widget.obscureText) ? hidePassword : false,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle,
                fillColor: AppColors.whiteColor,
                suffixIcon: widget.obscureText ?
                IconButton(
                  onPressed: (){
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword ?
                    CupertinoIcons.eye_solid :
                    CupertinoIcons.eye_slash_fill
                  ),
                ) :
                widget.suffixIcon ?? const SizedBox.shrink(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: .5,
                    color: AppColors.borderColor,
                    // color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: .5,
                    color: AppColors.borderColor,
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
