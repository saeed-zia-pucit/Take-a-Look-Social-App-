part of 'widgets.dart';

class CommentItem extends StatefulWidget {
  final CommentResponse comment;

  final VoidCallback onDeleteSuccess;

  CommentItem({Key? key, required this.comment, required this.onDeleteSuccess})
      : super(key: key);

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {

  final feedRepo = getIt<FeedRepoImpl>();

  void checkIfUserLikedPost() async {
    List<LikeInfo> likedPosts =
    await feedRepo.getFeedLikeComments(0, 100, widget.comment.id);
    UserModel? userModel = await getIt<ProfileRepo>().getUser();
    for (LikeInfo liked_post in likedPosts) {
      for (LikedBy likeBy in liked_post.likedBy) {
        var currentUserID = userModel!.id;
        if (likeBy.userId == currentUserID) {
          setState(() {
            _isCommentLiked = true;
          });
          break;
        }
      }
    }
  }
  bool _isCommentLiked = false; // Add this line

  @override
  void initState() {
    // TODO: implement initState
    checkIfUserLikedPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CommentResponse comment = widget.comment;
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .1,
        motion: ScrollMotion(),
        children: [
          SlidableDeleteButton(
            id: comment.id,
            onDeleteSuccess: () {
              //remove the specific record from the list
              widget.onDeleteSuccess();
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarWithSize(
                  height: 40,
                  width: 40,
                  image: AppImages.avatar,
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${comment.firstname} ${comment.lastname}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.time,
                            size: 18,
                            color: AppColors.greyColor,
                          ),
                          const Gap(5),
                          Text(
                            '${timeDifference(comment.createdAt)}',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      Text(
                        comment.content,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        '${comment.likesCount.toString()} Likes',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                IconButton(
                  onPressed: () async {
                    // Call postCommentLike when IconButton is pressed
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please wait!'),
                      ),
                    );
                    if (!_isCommentLiked) {
                      bool success = await FeedRepoImpl(Dio())
                          .postCommentLike(comment.id, comment.content);
                      if (success) {
                        // If the comment was successfully liked/unliked, toggle _isCommentLiked
                        setState(() {
                          comment.likesCount = comment.likesCount + 1;
                          _isCommentLiked = !_isCommentLiked;
                        });
                      }
                    } else {
                      bool success = await FeedRepoImpl(Dio())
                          .deleteCommentLike(comment.id, comment.content);
                      if (success) {
                        // If the comment was successfully liked/unliked, toggle _isCommentLiked
                        setState(() {
                          comment.likesCount = comment.likesCount - 1;
                          _isCommentLiked = !_isCommentLiked;
                        });
                      }
                    }
                  },
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: _isCommentLiked
                        ? AppColors.primaryColor
                        : Colors
                            .grey, // Use _isCommentLiked to decide the color
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.greyColor.withOpacity(.2),
            ),
          ],
        ),
      ),
    );
  }

  String timeDifference(String createdAt) {
    DateTime now = DateTime.now();
    DateTime createdTime = DateTime.parse(createdAt);

    Duration difference = now.difference(createdTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${(difference.inDays / 7).floor()} weeks ago';
    }
  }
}
