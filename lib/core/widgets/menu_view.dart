
import 'package:take_a_look/core/view_model/global_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/profile/presentation/pages/pages.dart';

import '../../pages/hair_color_formula_screens/follow_following/presentation/pages/pages.dart';
import '../../pages/hair_color_formula_screens/home_feed/presentation/pages/pages.dart';
import '../../pages/sign_up_screens/profile/presentation/widgets/widgets.dart';
import '/constants/app_colors.dart';
import '/constants/app_images.dart';
import '/core/extensions/context_extension.dart';
import '/core/extensions/number_extension.dart';
import '/core/router/router.dart';
import '/core/widgets/avatar_with_radius.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withOpacity(.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          context.statusBarHeightGap,
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                context.read<GlobalViewModel>().menuControl(open: false);
              },
              icon: Icon(Icons.close, color: AppColors.whiteColor,),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AvatarWithRadius(image: AppImages.avatar, radius: 50),
                  const Gap(10),
                  Text(
                    'Lavish Productline',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'lavishproductline@gmail.com | TL0548569 ',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: AppColors.whiteColor,
                    ),
                  ),

                  Divider(
                    height: 50,
                    indent: .15.wp(context),
                    endIndent: .15.wp(context),
                  ),

                  Column(
                    children: [
                      ItemOfProfileMenu(
                        onPressed: () {
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(
                            RouteNames.homeFeed,
                            extra: HomeFeedPageType.home,
                          );
                        },
                        text: 'Home',
                      ),
                      ItemOfProfileMenu(
                        onPressed: (){
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.go(
                            RouteNames.profile,
                            extra: ProfilePageType.mine,
                          );
                        },
                        text: 'Profile',
                      ),
                      ItemOfProfileMenu(
                        onPressed: () {
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(RouteNames.hairColor);
                        },
                        text: 'Take a Hair Formula',
                      ),
                      ItemOfProfileMenu(
                        onPressed: (){
                          context.read<GlobalViewModel>().menuControl(open: false);
                        },
                        text: 'E-learning',
                      ),
                      ItemOfProfileMenu(
                        onPressed: (){
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(RouteNames.followFollowing, extra: FollowFollowingPageType.followers);
                        },
                        text: 'Followers',
                      ),
                      ItemOfProfileMenu(
                        onPressed: (){
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(RouteNames.followFollowing, extra: FollowFollowingPageType.following);
                        },
                        text: 'Followings',
                      ),
                      ItemOfProfileMenu(
                        onPressed: () {
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(RouteNames.note);
                        },
                        text: 'Note',
                      ),
                      ItemOfProfileMenu(
                        onPressed: () {
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(RouteNames.notification);
                        },
                        text: 'Notification',
                      ),
                      ItemOfProfileMenu(
                        onPressed: () {
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(RouteNames.wishList);
                        },
                        text: 'Wishlist',
                      ),
                      ItemOfProfileMenu(
                        onPressed: () {
                          context.read<GlobalViewModel>().menuControl(open: false);
                          context.push(RouteNames.miscellaneous);
                        },
                        text: 'Miscellaneous ',
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Text(
            'App Version v0.1\n\n',
            style: GoogleFonts.nunito(
              fontSize: 12,
              color: AppColors.whiteColor
            ),
          ),
        ],
      ),
    );
  }
}
