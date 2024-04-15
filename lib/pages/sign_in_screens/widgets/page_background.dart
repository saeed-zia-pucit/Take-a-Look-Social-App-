
import 'package:cosmetologist/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({super.key, required this.image});

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
