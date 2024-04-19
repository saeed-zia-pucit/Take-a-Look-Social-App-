
import '/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PageBackgroundImage extends StatelessWidget {
  const PageBackgroundImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      height: context.height,
      width: context.width,
      image: AssetImage(image),
    );
  }
}
