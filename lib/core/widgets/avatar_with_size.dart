
import 'package:flutter/material.dart';

class AvatarWithSize extends StatelessWidget {
  const AvatarWithSize({super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    if(image.contains("www")) {
      return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image:NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
    }else{
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image:AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
