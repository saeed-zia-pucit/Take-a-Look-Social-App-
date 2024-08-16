part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key, required this.profilePageType, required this.userId});

  final ProfilePageType profilePageType;
  String userId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfilePageType profilePageType;

  @override
  void initState() {
    profilePageType = widget.profilePageType;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (profilePageType.isMine && widget.userId.isEmpty) {
        context.read<ProfileViewModel>().getUser();
      } else {
        context.read<ProfileViewModel>().getUserById(widget.userId);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(builder: (context, viewModel, _) {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: (profilePageType.isMine)
                  ? IconButton(
                      onPressed: () {
                        // context.read<GlobalViewModel>().menuControl(open: true);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.chevron_left),
                    )
                  : null,
              title: const Text('Profile'),
              actions: [
                TextButton(
                  onPressed: (profilePageType.isMine)
                      ? () async {
                          await context.push(
                            RouteNames.profileSetupEdit,
                            extra: SetupEditProfileType.edit,
                          );
                          await viewModel.getUser();
                        }
                      : viewModel.isFollower
                          ? () async {
                              bool unfollowed = await context
                                  .read<ProfileViewModel>()
                                  .unfollowUser(widget.userId
                                  );
                              if (unfollowed) {
                                await viewModel
                                    .getUserById(widget.userId);
                              }
                            }
                          : () async {
                              bool followed = await context
                                  .read<ProfileViewModel>()
                                  .followUser(widget.userId
                                  );
                              if (followed) {
                                await viewModel
                                    .getUserById(widget.userId);
                              }
                            },
                  child: (profilePageType.isMine)
                      ? const Text('Edit')
                      : viewModel.isFollower
                          ? const Text('Unfollow')
                          : const Text('Follow'),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AvatarWithRadius(
                            image: viewModel.avatarUrl.isEmpty
                                ? AppImages.avatar
                                : viewModel.avatarUrl,
                            radius: 30),
                        Column(
                          children: [
                            Text(
                              '${viewModel.postCount}',
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Posts',
                              style: GoogleFonts.nunito(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${viewModel.followersCount}',
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Followers',
                              style: GoogleFonts.nunito(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${viewModel.followingsCount}',
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Followings',
                              style: GoogleFonts.nunito(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // 'Lavish Productline',
                                  '${viewModel.firstName} ${viewModel.lastName}',
                                  style: TextStyle(
                                    // color: AppColors.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  // 'lavishproductline@gmail.com | TL0548569 ',
                                  // (viewModel.license.isEmpty) ?
                                  // '${viewModel.emailName} | Student' :
                                  '${viewModel.emailName}',
                                  // '${viewModel.emailName} | ${viewModel.license}',
                                  style: TextStyle(
                                    // color: AppColors.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            (context.watch<SetupEditProfileViewModel>().image !=
                                    null)
                                ? SizedBox(
                                    height: 50.h(context),
                                    width: 50.h(context),
                                    child: const Icon(
                                      CupertinoIcons.checkmark_seal_fill,
                                      color: Colors.blue,
                                    ),
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   image: DecorationImage(
                                    //     image: AssetImage(AppImages.cosmetologyLicense),
                                    //     fit: BoxFit.cover,
                                    //   )
                                    // ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        const Gap(10),
                        Text(
                          // 'The base color of dark blonde is gold, while\nthat of light brown.',
                          viewModel.bio,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const Gap(30),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70.h(context),
                              width: 70.h(context),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.greyColor),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 34,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              'Add Portfolio',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Column(
                          children: [
                            Container(
                              height: 70.h(context),
                              width: 70.h(context),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: SvgPicture.asset(AppIcons.instaIcon),
                              ),
                            ),
                            const Gap(10),
                            Text(
                              'Gallery',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (profilePageType.isMine) {
                                  context.push(RouteNames.wishList,
                                      extra: WishListPageType.save);
                                }
                              },
                              child: Container(
                                height: 70.h(context),
                                width: 70.h(context),
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SvgPicture.asset(AppIcons.save),
                                ),
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                if (profilePageType.isMine) {
                                  context.push(RouteNames.wishList,
                                      extra: WishListPageType.save);
                                }
                              },
                              child: Text(
                                'Saved',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Gap(30),
                    GridView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ItemOfProfilePost(haveIcon: index.isOdd);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ).menu(context),
        ],
      ).loadingView(viewModel.isLoading && viewModel.emailName.isEmpty);
    });
  }
}

enum ProfilePageType {
  mine,
  cosmetologist,
}

extension ProfilePageTypeExtension on ProfilePageType {
  bool get isMine => ProfilePageType.mine == this;

  bool get isCosmetologist => ProfilePageType.cosmetologist == this;
}
