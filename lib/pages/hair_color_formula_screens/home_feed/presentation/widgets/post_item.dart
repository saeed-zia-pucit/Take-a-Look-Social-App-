
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/presentation/widgets/post_author.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/presentation/widgets/post_content.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/presentation/widgets/post_like_comment.dart';

import '../pages/home_feed.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.homeFeedPageType});

  final HomeFeedPageType homeFeedPageType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostAuthor(homeFeedPageType: homeFeedPageType),
        const PostContent(),
        PostLikeComment(homeFeedPageType: homeFeedPageType,),
        const Gap(20),
      ],
    );
  }
}
