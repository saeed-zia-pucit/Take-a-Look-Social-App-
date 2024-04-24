
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/data/repo/social_auth.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/di_service.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/presentation/pages/pages.dart';

import '/constants/app_colors.dart';
import '/constants/app_icons.dart';
import '/core/extensions/context_extension.dart';
import '/core/extensions/number_extension.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({super.key,
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
              AppIcons.facebookIcon,
              height: 23.h(context),
            ),
            if (socialButtonType == SocialButtonType.google)
            SvgPicture.asset(
              AppIcons.googleIcon,
              height: 23.h(context),
            ),
            if (socialButtonType == SocialButtonType.apple)
            SvgPicture.asset(
              AppIcons.appleIcon,
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
  Widget facebookButton(BuildContext context) => SocialAuthButton(
    onPressed: () async {
      var user = await getIt.get<SocialAuth>().signInWithFacebook();
      if (user == null) return;
      if (context.mounted) {
        context.go(
          RouteNames.homeFeed,
          extra: HomeFeedPageType.feed,
        );
      }
    },
    socialButtonType: SocialButtonType.facebook,
    text: 'Continue with Facebook',
  );

  Widget googleButton(BuildContext context) => SocialAuthButton(
    onPressed: () async {
      var user = await getIt.get<SocialAuth>().signInWithGoogle();
      if (user == null) return;
      if (context.mounted) {
        context.go(
          RouteNames.homeFeed,
          extra: HomeFeedPageType.feed,
        );
      }
    },
    socialButtonType: SocialButtonType.google,
    text: 'Continue with Google',
  );

  Widget appleButton(BuildContext context) =>
      // (Platform.isIOS) ?
      SocialAuthButton(
    onPressed: () async {
      var user = await getIt.get<SocialAuth>().signInWithApple();
      if (user == null) return;
      if (context.mounted) {
        context.go(
          RouteNames.homeFeed,
          extra: HomeFeedPageType.feed,
        );
      }
    },
    socialButtonType: SocialButtonType.apple,
    text: 'Continue with Apple',
  ) ;
      // const SizedBox.shrink();
}

enum SocialButtonType {
  facebook,
  google,
  apple,
}
