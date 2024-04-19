
part of 'widgets.dart';

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
