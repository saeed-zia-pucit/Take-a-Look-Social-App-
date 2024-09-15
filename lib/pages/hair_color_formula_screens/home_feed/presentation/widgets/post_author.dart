part of 'widgets.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor(
      {super.key,
      required this.homeFeedPageType,
      required this.post,
      required this.onPostDeleted,
      required this.userModel});

  final Function onPostDeleted;
  final HomeFeedPageType homeFeedPageType;
  final PostModel post;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    PostModel posts = post;
    return GestureDetector(
      onTap: () {
        context.push(
          RouteNames.profile,
          extra: {
            'pageType': ProfilePageType.cosmetologist,
            'userId': "", // Replace userId with the actual user ID variable
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: posts.authorImageUrl.isEmpty
                          ? NetworkImage(posts.imageUrl)
                          : NetworkImage(posts.authorImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posts.authorFirstname + ' ' + posts.authorLastname,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Curly | ${timeDifference(posts.createdAt)}',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            /* (homeFeedPageType.isFeed)
                ? TextButton(
                    onPressed: () {},
                    child: const SizedBox.shrink() */ /*Text('+ Unfollow')*/ /*,
                  )
                : IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_border,
                                  color: AppColors.blackColor,
                                ),
                                label: Text(
                                  'Save',
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppIcons.editIcon),
                                label: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon:
                                    SvgPicture.asset(AppIcons.trashBasketIcon),
                                label: Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              context.bottomHeightGap,
                              // Gap(50)
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                    padding: EdgeInsets.zero,
                  ),*/
            Visibility(
              visible: post.authorId == userModel.id,
              child:IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).viewInsets.bottom, // Padding to adjust for the keyboard
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          UpdatePortfolio(
                                            onSuccess: () {
                                              onPostDeleted();
                                              Navigator.pop(context);
                                            },
                                            userModel: userModel,
                                            content: post.content,
                                            selectedCategory: post.category,
                                            postId: post.postId,
                                          ),
                                          context.bottomHeightGap,
                                          // Gap(50)
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: SvgPicture.asset(AppIcons.editIcon),
                            label: Text(
                              'Edit',
                              style: TextStyle(
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              deletePost(posts.postId);
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset(AppIcons.trashBasketIcon),
                            label: Text(
                              'Delete',
                              style: TextStyle(
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          context.bottomHeightGap,
                          // Gap(50)
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.more_vert),
                padding: EdgeInsets.zero,
              ),
            )

          ],
        ),
      ),
    );
  }

  Future<void> deletePost(String postId) async {
    final Dio dio = Dio();
    await AppLocalData.updateToken();
    final token = await AppLocalData.getUserToken;
    final url = Uri.parse('${AppLocalData.BaseURL}/feed/post/$postId');
    final response = await http.delete(
      url,
      headers: {'accept': '*/*', 'Authorization': 'Bearer $token'},
    );

    // Response response = await dio.delete(
    //   '${AppLocalData.BaseURL}/feed/post/$postId',
    //   options:  Options(
    //     headers: {
    //       'Accept': '*/*',
    //       'Authorization': 'Bearer $token',
    //     },
    //   ),
    // );
    print('dfffffffffffffffffffffffffffffffffffg');
    if (response.statusCode == 500) {
      print('ddddddddddddddddddddddddddddddddddddddddddd');
      onPostDeleted();
    } else {
      print('Failed to delete post. Status code: ${response.statusCode}');
    }
  }

  String timeDifference(String createdAt) {
    DateTime now = DateTime.now();
    DateTime createdTime = DateTime.parse(createdAt+'z').toUtc();
    print('before');
    print(createdTime.timeZoneName);
    Locale local =Locale('pk','PK');
    Duration difference = now.difference(createdTime);
    print('After');
    print(createdTime.timeZoneName);

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
