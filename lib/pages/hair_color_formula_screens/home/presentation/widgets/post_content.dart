
import 'package:flutter/material.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text('Dark blonde hair color often has highlights and low lights to give it depth and shimmer. You need to protect and enhance the color distinction every time you wash. Try the Blondie Gloss Shampoo.'),
        ),
        Image.asset(
          height: context.width - 100,
          width: double.infinity,
          AppImages.hair1,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
