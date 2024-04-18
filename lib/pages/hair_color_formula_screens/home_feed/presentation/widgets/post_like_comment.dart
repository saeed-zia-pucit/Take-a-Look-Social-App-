
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_icons.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/core/widgets/avatar_with_size.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/comments_likes/presentation/pages/comments_likes_page.dart';

import '../pages/home_feed.dart';

class PostLikeComment extends StatelessWidget {
  const PostLikeComment({super.key, required this.homeFeedPageType});

  final HomeFeedPageType homeFeedPageType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.heart_fill, color: AppColors.primaryColor,),
                    // label: Text('255', style: TextStyle(color: AppColors.blackColor),),
                  ),
                  InkWell(
                    onTap: (){
                      context.push(RouteNames.comments,
                        extra: CommentLikesPageType.likes,
                      );
                    },
                    child: Text('255', style: TextStyle(color: AppColors.blackColor),),
                  ),
                  TextButton.icon(
                    onPressed: (){
                      context.push(RouteNames.comments,
                        extra: CommentLikesPageType.comments,
                      );
                    },
                    icon: SvgPicture.asset(AppIcons.commentIcon),
                    label: Text('44', style: TextStyle(color: AppColors.blackColor),),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.bookmark_border),
              )
            ],
          ),
          if (homeFeedPageType.isFeed)
          Row(
            children: [
              AvatarWithSize(
                height: 30,
                width: 30,
                image: AppImages.avatar,
              ),
              const Gap(10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.push(RouteNames.comments,
                      extra: CommentLikesPageType.comments,
                    );
                  },
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: AppColors.greyColor.withOpacity(.3),
                      )
                    ),
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.greyColor
                          ),
                        ),
                        Icon(Icons.send, size: 18, color: AppColors.greyColor,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
