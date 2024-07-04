
part of 'widgets.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.homeFeedPageType,required this.post});

  final HomeFeedPageType homeFeedPageType;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostAuthor(homeFeedPageType: homeFeedPageType,post: post),
        PostContent(post: post),
        PostLikeComment(homeFeedPageType: homeFeedPageType,post: post),
        const Gap(20),
      ],
    );
  }

}
