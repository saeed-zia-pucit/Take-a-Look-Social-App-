
import 'package:flutter/material.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_formula/presentation/widgets/hair_items.dart';

class HairView extends StatelessWidget {
  const HairView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Guide to blonde hair colors Notes',
          ),
        ),
        SizedBox(
          height: context.width - 50,
          width: double.infinity,
          child: Image.asset(
            AppImages.hair1,
            fit: BoxFit.cover,
          ),
        ),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HairItem(),
            HairItem(),
            HairItem(),
            HairItem(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Additional Notes',
              ),
              Text(
                'Dark blonde is the combination of yellow and black, while light brown is the combination of brown and white. The base color of dark blonde is gold, while that of light brown is brown. Both colors are just separated by one shade.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.greyColor
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
