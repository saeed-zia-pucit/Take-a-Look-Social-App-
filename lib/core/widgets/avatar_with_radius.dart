import 'package:flutter/material.dart';

class AvatarWithRadius extends StatelessWidget {
  const AvatarWithRadius({
    super.key,
    required this.image,
    required this.radius,
  });

  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // Check if the image string contains a URL pattern
    bool isNetworkImage = image.startsWith('http://') || image.startsWith('https://');

    return CircleAvatar(
      radius: radius,
      backgroundImage: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
    );
  }
}