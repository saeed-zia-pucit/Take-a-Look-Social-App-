
import 'package:flutter/material.dart';
import 'package:take_a_look/constants/app_colors.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.location_on_sharp,
            color: AppColors.primaryColor,
          ),
          Text(
            'Street no 2, San Francisco, USA',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.greyColor,
            ),
          )
        ],
      ),
    );
  }
}
