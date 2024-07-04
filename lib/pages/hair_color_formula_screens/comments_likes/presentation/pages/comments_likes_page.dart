part of 'pages.dart';

class CommentLikesPage extends StatefulWidget {
  const CommentLikesPage({
    super.key,
    required this.commentLikesPageType,
    required this.post,
    this.onNewComment,
    this.onDeleteComment,
  });

  final CommentLikesPageType commentLikesPageType;
  final PostModel post;

  final VoidCallback? onNewComment;
  final VoidCallback? onDeleteComment;

  @override
  State<CommentLikesPage> createState() => _CommentLikesPageState();
}

class _CommentLikesPageState extends State<CommentLikesPage> {
  late CommentLikesPageType commentLikesPageType;
  final commentController = TextEditingController();

  List<CommentResponse> _comments = [];
  final feedRepo = getIt<FeedRepoImpl>();

  @override
  void initState() {
    commentLikesPageType = widget.commentLikesPageType;
    // Do something with the comments
    feedRepo
        .getFeedCommentsByPostID(0, 100, widget.post.postId)
        .then((comments) {
      setState(() {
        _comments = comments;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (commentLikesPageType.isComments) ? 'Comments' : 'Likes',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      AvatarWithSize(
                        image: AppImages.avatar,
                        height: 25,
                        width: 25,
                      ),
                      const Gap(10),
                      Text(_comments.isEmpty
                          ? 'No comments'
                          : _comments.length == 1
                              ? '${_comments[0].firstname} ${_comments[0].lastname}'
                              : '${_comments[0].firstname} ${_comments[0].lastname} & ${_comments.length - 1} others commented')
                    ],
                  ),
                ),
                if (commentLikesPageType.isComments)
                  Column(
                    children: _comments
                        .map((comment) => CommentItem(
                              comment: comment,
                              onDeleteSuccess: () {
                                //remove the specific record from the list
                                setState(() {
                                  _comments.remove(comment);
                                });

                                // Call the onNewComment callback
                                widget.onDeleteComment?.call();
                              },
                            ))
                        .toList(),
                  ),
                if (commentLikesPageType.isLikes)
                  const Column(
                    children: [
                      // UserItem(),
                      // UserItem(),
                      // UserItem(),
                      // UserItem(),
                      // UserItem(),
                    ],
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColors.whiteColor,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 50,
              ),
              child: TextField(
                controller: commentController,
                style: const TextStyle(
                  fontSize: 10,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Write a comment...', // Move hintText here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      // Check if the text is not empty
                      if (commentController.text.trim().isNotEmpty) {
                        // Call the postComment API
                        // Replace 'postId' with the actual postId
                        bool isPosted = await feedRepo.postComment(
                            widget.post.postId, commentController.text.trim());
                        // / Clear the text in the TextEditingController
                        commentController.clear();
                        if (isPosted) {
                          List<CommentResponse> comments =
                              await feedRepo.getFeedCommentsByPostID(
                                  0, 100, widget.post.postId);
                          // Do something with the comments
                          setState(() {
                            _comments = comments;
                          });

                          // Call the onNewComment callback
                          widget.onNewComment?.call();
                        }else{
                          // Show a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to post comment'),
                            ),
                          );
                        }
                      } else {
                        // Show a snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Comment cannot be empty'),
                          ),
                        );
                      }

                      FocusScope.of(context).unfocus();
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum CommentLikesPageType {
  comments,
  likes,
}

extension CommentLikesPageTypeExtension on CommentLikesPageType {
  bool get isComments => CommentLikesPageType.comments == this;

  bool get isLikes => CommentLikesPageType.likes == this;
}
