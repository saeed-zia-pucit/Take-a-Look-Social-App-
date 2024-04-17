
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/core/widgets/avatar_with_size.dart';
import 'package:take_a_look/core/widgets/slidable_delete_button.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: const ActionPane(
        extentRatio: .1,
        motion: ScrollMotion(),
        children: [
          SlidableDeleteButton(),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarWithSize(
                  height: 40,
                  width: 40,
                  image: AppImages.avatar,
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Lavish Productline'),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.time,
                            size: 18,
                            color: AppColors.greyColor,
                          ),
                          const Gap(5),
                          Text(
                            '3hrs ago',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),

                      const Gap(5),
                      const Text(
                        'Just wanted you to know that we had a wonderful tripin Incredible India',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        '230 Likes',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(10),
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
            Divider(color: AppColors.greyColor.withOpacity(.2),),
          ],
        ),
      ),
    );
  }
}
