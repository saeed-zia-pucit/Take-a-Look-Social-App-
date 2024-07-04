part of 'widgets.dart';

class PostLikeComment extends StatefulWidget {
  const PostLikeComment({
    super.key,
    required this.homeFeedPageType,
    required this.post,
  });

  final HomeFeedPageType homeFeedPageType;
  final PostModel post;

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
        await feedRepo.getFeedLike(0, 100, widget.post.postId);

    UserModel? userModel = await getIt<ProfileRepo>().getUser();
    for (LikeInfo liked_post in likedPosts) {
      for (LikedBy likeBy in liked_post.likedBy) {
        var currentUserID = userModel!.id;
        if (likeBy.userId == currentUserID) {
          setState(() {
            isLiked = true;
          });
          break;
        }
      }
    }
  }

  @override
  void initState() {
    checkIfUserLikedPost();
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
                        await feedRepo.likeContent(widget.post
                            .postId); // Call likeContent when isLiked is true
                      } else {
                        likes--;
                        await feedRepo.unlikeContent(widget.post
                            .postId); // Call unlikeContent when isLiked is false
                      }

                      setState(() {});
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
                onPressed: () {
                  setState(() {
                    isBookMark = !isBookMark;
                  });
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
                  image: AppImages.avatar,
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
