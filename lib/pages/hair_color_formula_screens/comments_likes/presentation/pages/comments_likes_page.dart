part of 'pages.dart';

class CommentLikesPage extends StatefulWidget {
  const CommentLikesPage({
    super.key,
    required this.commentLikesPageType,
    required this.post,
    required this.userModel,
    this.onNewComment,
    this.onDeleteComment,
  });

  final CommentLikesPageType commentLikesPageType;
  final PostModel post;
  final UserModel userModel;

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
  
  Future<List<CommentResponse>> getComments()async{
    List<CommentResponse> comments = await feedRepo
        .getFeedCommentsByPostID(0, 100, widget.post.postId);
    return comments;
  }

  @override
  void initState() {
    commentLikesPageType = widget.commentLikesPageType;
    // Do something with the comments
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
                        image: widget.userModel.avatarUrl!.isEmpty?AppImages.avatar:widget.userModel.avatarUrl!,
                        height: 25,
                        width: 25,
                      ),
                      const Gap(10),
                      FutureBuilder(future: getComments(), builder: (context,snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const SizedBox.shrink();
                        }
                        else{
                          if(snapshot.data!.isNotEmpty){
                            var data = snapshot.data;
                            return Text(data!.length == 1
                                ? '${data[0].firstname} ${data[0].lastname}'
                                : '${data[0].firstname} ${data[0].lastname} & ${data.length - 1} others commented');
                          }
                          else {
                            return const Text('No Comments');
                          }
                        }
                      }),
                    ],
                  ),
                ),
                if (commentLikesPageType.isComments)
                  FutureBuilder(future: getComments(), builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }
                    else{
                      if(snapshot.data!.isNotEmpty){
                        var data = snapshot.data;
                        return ListView.builder(
                          itemCount: data!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                          return CommentItem(
                            comment: data[index],
                            userModel: widget.userModel,
                            onDeleteSuccess: () {
                              //remove the specific record from the list
                              setState(() {
                                _comments.remove(data[index]);
                              });

                              // Call the onNewComment callback
                              widget.onDeleteComment?.call();
                            },
                          );
                        });
                      }
                      else {
                        return const SizedBox.shrink();
                      }
                    }
                  }),
                  
                  // Column(
                  //   children: _comments
                  //       .map((comment) => CommentItem(
                  //             comment: comment,
                  //     userModel: widget.userModel,
                  //             onDeleteSuccess: () {
                  //               //remove the specific record from the list
                  //               setState(() {
                  //                 _comments.remove(comment);
                  //               });
                  //
                  //               // Call the onNewComment callback
                  //               widget.onDeleteComment?.call();
                  //             },
                  //           ))
                  //       .toList(),
                  // ),
                
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
                          widget.onNewComment?.call();
                          // List<CommentResponse> comments =
                          //     await feedRepo.getFeedCommentsByPostID(
                          //         0, 100, widget.post.postId);
                          // // Do something with the comments
                          // setState(() {
                          //   _comments = comments;
                          // });
                          //
                          // // Call the onNewComment callback
                          // widget.onNewComment?.call();
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
