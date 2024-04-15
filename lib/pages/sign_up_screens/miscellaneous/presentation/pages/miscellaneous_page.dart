
import 'package:provider/provider.dart';
import 'package:take_a_look/pages/sign_up_screens/miscellaneous/presentation/widgets/delete_account_view.dart';
import 'package:take_a_look/pages/sign_up_screens/miscellaneous/view_model/miscellaneous_view_model.dart';

import '/constants/app_colors.dart';
import '/constants/app_svg.dart';
import '/core/extensions/number_extension.dart';
import '/core/router/router.dart';
import '/pages/sign_up_screens/about_term_privacy/presentation/pages/about_term_privacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../profile/presentation/widgets/item_of_profile_menu.dart';

class MiscellaneousPage extends StatefulWidget {
  const MiscellaneousPage({super.key});

  @override
  State<MiscellaneousPage> createState() => _MiscellaneousPageState();
}

class _MiscellaneousPageState extends State<MiscellaneousPage> {
  @override
  Widget build(BuildContext context) {
    final read = context.read<MiscellaneousViewModel>();
    final watch = context.watch<MiscellaneousViewModel>();
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Miscellaneous'
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.settings),
                          text: 'Settings',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () {
                            read.onTapDeleteAccount(true);
                          },
                          text: 'Delete Account ',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.aboutTermPrivacy,
                            extra: AboutTermPrivacyType.about,
                          ),
                          text: 'About the app',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.aboutTermPrivacy,
                            extra: AboutTermPrivacyType.privacy,
                          ),
                          text: 'Privacy policy',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.aboutTermPrivacy,
                            extra: AboutTermPrivacyType.term,
                          ),
                          text: 'Terms and condition ',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: (){},
                          text: 'Logout',
                          color: AppColors.greyColor,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Center(child: SvgPicture.asset(AppSVG.firstOnboard_2, height: .4.hp(context),))
            ],
          ),
        ),
        if (watch.showDeleteDialog)
          const DeleteAccountView(),

      ],
    );
  }
}
