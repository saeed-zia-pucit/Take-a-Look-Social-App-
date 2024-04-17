
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_icons.dart';
import 'package:take_a_look/core/extensions/number_extension.dart';
import 'package:take_a_look/pages/sign_in_screens/widgets/header.dart';
import 'package:take_a_look/pages/sign_up_screens/miscellaneous/view_model/miscellaneous_view_model.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {

    final read = context.read<MiscellaneousViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.deleteIcon),
            const Gap(40),
            Header(
              title: 'Delete Account ',
              content1: 'Are you sure you want to delete your account?',
              titleColor: AppColors.greyColor,
              content1Color: AppColors.greyColor,
            ),
            const Gap(50),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60.h(context),
                    child: ElevatedButton(
                      onPressed: () => read.onTapDeleteAccount(false),
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: SizedBox(
                    height: 60.h(context),
                    child: OutlinedButton(
                      onPressed: () => read.onTapDeleteAccount(false),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
