part of 'widgets.dart';

class PostItem extends StatelessWidget {
  PostItem(
      {super.key,
      required this.homeFeedPageType,
      required this.post,
      required this.userModel,
      required this.onPostDeleted});

  final HomeFeedPageType homeFeedPageType;
  final Function onPostDeleted;
  final PostModel post;
  late UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostAuthor(
          homeFeedPageType: homeFeedPageType,
          post: post,
          onPostDeleted: () {
            onPostDeleted();
          }, userModel: userModel,
        ),
        PostContent(post: post),
        PostLikeComment(
            homeFeedPageType: homeFeedPageType,
            post: post,
            userModel: userModel),
        const Gap(20),
      ],
    );
  }
}
