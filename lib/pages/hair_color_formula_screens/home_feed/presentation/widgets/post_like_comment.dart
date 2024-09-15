part of 'widgets.dart';

class PostLikeComment extends StatefulWidget {
  const PostLikeComment({
    super.key,
    required this.homeFeedPageType,
    required this.post,
    required this.userModel,
  });

  final HomeFeedPageType homeFeedPageType;
  final PostModel post;
  final UserModel userModel;

  @override
  _PostLikeCommentState createState() => _PostLikeCommentState();
}

class _PostLikeCommentState extends State<PostLikeComment> {
  bool isLiked = false;
  bool isBookMark = false;
  int likes = 0;
  final feedRepo = getIt<FeedRepoImpl>();

  void checkIfUserLikedPost() async {
    List<LikeInfo> likedPosts =
        await feedRepo.getFeedLike(0, 500, widget.post.postId);
    for (LikeInfo liked_post in likedPosts) {
      for (LikedBy likeBy in liked_post.likedBy) {
        var currentUserID = widget.userModel.id;
        if (likeBy.userId == currentUserID) {
          setState(() {
            isLiked = true;
          });
          break;
        }
      }
    }
  }

  void checkIfUserSavedPost() async {
    List<PostModel> savePostModel =
        await feedRepo.getFeedSaved(0, 500, widget.post.postId);
    for (PostModel liked_post in savePostModel) {
      if (widget.post.postId == liked_post.postId) {
        setState(() {
          isBookMark = true;
        });
        break;
      }
    }
  }

  @override
  void initState() {
    checkIfUserLikedPost();
    checkIfUserSavedPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      isLiked = !isLiked;
                      if (isLiked) {
                        likes++;
                        setState(() {});
                        await feedRepo.likeContent(widget.post.postId); // Call likeContent when isLiked is true
                      } else {
                        likes--;
                        setState(() {});
                        await feedRepo.unlikeContent(widget.post.postId); // Call unlikeContent when isLiked is false
                      }
                      //setState(() {});
                    },
                    icon: Icon(
                      CupertinoIcons.heart_fill,
                      color: !isLiked ? Colors.grey : AppColors.primaryColor,
                    ),
                    // label: Text('255', style: TextStyle(color: AppColors.blackColor),),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(
                        RouteNames.comments,
                        extra: CommentLikesPageType.likes,
                      );
                    },
                    child: Text(
                      (widget.post.likesCount + likes).toString(),
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentLikesPage(
                            commentLikesPageType: CommentLikesPageType.comments,
                            post: widget.post,
                            userModel: widget.userModel,
                            onNewComment: () {
                              setState(() {
                                widget.post.commentsCount++;
                              });
                            },
                            onDeleteComment: () {
                              setState(() {
                                widget.post.commentsCount--;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(AppIcons.commentIcon),
                    label: Text(
                      widget.post.commentsCount.toString(),
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  isBookMark = !isBookMark;
                  if (isBookMark) {
                    await feedRepo.SaveContent(widget
                        .post.postId); // Call likeContent when isLiked is true
                  } else {
                    await feedRepo.unSaveContent(widget.post
                        .postId); // Call unlikeContent when isLiked is false
                  }
                  setState(() {});
                },
                icon: Icon(
                  Icons.bookmark_border,
                  color: !isBookMark ? Colors.grey : AppColors.primaryColor,
                ),
              )
            ],
          ),
          if (widget.homeFeedPageType.isFeed)
            Row(
              children: [
                AvatarWithSize(
                  height: 30,
                  width: 30,
                  image: widget.userModel.avatarUrl!.isEmpty
                      ? AppImages.avatar
                      : widget.userModel.avatarUrl!,
                ),
                const Gap(10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentLikesPage(
                            commentLikesPageType: CommentLikesPageType.comments,
                            post: widget.post,
                            userModel: widget.userModel,
                          ),
                        ),
                      ); /*
                      context.push(
                        RouteNames.comments,
                        extra: CommentLikesPageType.comments,
                      );*/
                    },
                    child: Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: AppColors.greyColor.withOpacity(.3),
                          )),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Comments',
                            style: TextStyle(
                                fontSize: 10, color: AppColors.greyColor),
                          ),
                          Icon(
                            Icons.send,
                            size: 18,
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
