
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/core/data/models/user_model.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.userModel});

  final UserModel userModel;

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
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.avatar),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userModel.firstname} ${userModel.lastname}',
                      ),
                      if (userModel.bio != null)
                      Text(
                        (userModel.bio!.isEmpty) ?
                        'Student' :
                        'Cosmetologist',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: (){},
                child: const Text(
                  'Unfollow',
                ),
              ),
            ],
          ),
          const Gap(10),
          Divider(
            indent: 50,
            color: AppColors.greyColor.withOpacity(.1),
          ),
        ],
      ),
    );
  }
}
