
part of 'pages.dart';

class CommentLikesPage extends StatefulWidget {
  const CommentLikesPage({super.key, required this.commentLikesPageType});

  final CommentLikesPageType commentLikesPageType;

  @override
  State<CommentLikesPage> createState() => _CommentLikesPageState();
}

class _CommentLikesPageState extends State<CommentLikesPage> {

  late CommentLikesPageType commentLikesPageType;

  @override
  void initState() {
    commentLikesPageType = widget.commentLikesPageType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (commentLikesPageType.isComments) ?
          'Comments' : 'Likes',
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
                      const Text('Lavish Productline & 5 others commented  ')
                    ],
                  ),
                ),
                if (commentLikesPageType.isComments)
                const Column(
                  children: [
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                  ],
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
                controller: TextEditingController(text: 'Comments'),
                style: const TextStyle(
                  fontSize: 10,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.send, color: AppColors.greyColor,),
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
