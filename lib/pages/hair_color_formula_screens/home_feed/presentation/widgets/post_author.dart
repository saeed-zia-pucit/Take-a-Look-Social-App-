
part of 'widgets.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor({super.key, required this.homeFeedPageType});

  final HomeFeedPageType homeFeedPageType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(RouteNames.profile,
            extra: ProfilePageType.cosmetologist
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
                      image: AssetImage(AppImages.avatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lavish Productline',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Curly | 1hr',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w600
                      ),
                    ),

                  ],
                )
              ],
            ),
            (homeFeedPageType.isFeed) ?
            TextButton(
              onPressed: (){},
              child: const Text('+ Unfollow'),
            ) :
            IconButton(
              onPressed: (){

                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.bookmark_border, color: AppColors.blackColor,),
                          label: Text(
                            'Save',
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: (){},
                          icon: SvgPicture.asset(AppIcons.editIcon),
                          label: Text(
                            'Edit',
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: (){},
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
          ],
        ),
      ),
    );
  }
}
