
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home/presentation/widgets/post_author.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home/presentation/widgets/post_content.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home/presentation/widgets/post_like_comment.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PostAuthor(),
        PostContent(),
        PostLikeComment(),
        Gap(20),
      ],
    );
  }
}
