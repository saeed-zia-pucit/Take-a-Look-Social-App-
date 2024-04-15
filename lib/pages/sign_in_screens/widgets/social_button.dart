
import '/constants/app_colors.dart';
import '/constants/app_svg.dart';
import '/core/extensions/context_extension.dart';
import '/core/extensions/number_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key,
    required this.onPressed,
    required this.socialButtonType,
    required this.text,
    this.fontSize,
  });

  final void Function() onPressed;
  final SocialButtonType socialButtonType;
  final String text;
  final TextStyle? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: MaterialButton(
        height: 45.h(context),
        minWidth: context.width,
        color: (socialButtonType == SocialButtonType.facebook) ?
        const Color.fromRGBO(59, 89, 153, 1) :
        (socialButtonType == SocialButtonType.google) ? AppColors.primaryColor : AppColors.blackColor,
        elevation: 0,
        highlightElevation: 0,
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const Gap(20),
            if (socialButtonType == SocialButtonType.facebook)
            SvgPicture.asset(
              AppSVG.facebookIcon,
              height: 23.h(context),
            ),
            if (socialButtonType == SocialButtonType.google)
            SvgPicture.asset(
              AppSVG.googleIcon,
              height: 23.h(context),
            ),
            if (socialButtonType == SocialButtonType.apple)
            SvgPicture.asset(
              AppSVG.appleIcon,
              height: 23.h(context),
            ),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: fontSize ?? TextStyle(
                    fontSize: 14.h(context),
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension SocialButtonExtension on BuildContext {
  Widget get facebookButton => SocialButton(
    onPressed: (){},
    socialButtonType: SocialButtonType.facebook,
    text: 'Continue with Facebook',
  );
  Widget get googleButton => SocialButton(
    onPressed: (){},
    socialButtonType: SocialButtonType.google,
    text: 'Continue with Google',
  );
  Widget get appleButton => SocialButton(
    onPressed: (){},
    socialButtonType: SocialButtonType.apple,
    text: 'Continue with Apple',
  );
}

enum SocialButtonType {
  facebook,
  google,
  apple,
}
