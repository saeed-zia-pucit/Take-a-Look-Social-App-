
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_images.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
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
                  ),
                ),
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lavish Productline',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Curly | 1hr',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                ],
              )
            ],
          ),
          TextButton(
            onPressed: (){},
            child: Text(' + Unfollow'),
          )
        ],
      ),
    );
  }
}
