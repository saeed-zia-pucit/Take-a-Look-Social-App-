
part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.profilePageType});

  final ProfilePageType profilePageType;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late ProfilePageType profilePageType;

  @override
  void initState() {
    profilePageType = widget.profilePageType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileViewModel>();
    final watch = context.watch<ProfileViewModel>();
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => read.onTapMenu(true),
              icon: const Icon(Icons.sort),
            ),
            title: const Text('Profile'),
            actions: [
              TextButton(
                onPressed: (profilePageType.isMine) ?
                    () {
                  context.push(
                    RouteNames.profileSetupEdit,
                    extra: SetupEditProfileType.edit,
                  );
                } : (){},
                child: (profilePageType.isMine) ?
                const Text('Edit') :
                const Text('Follow') ,
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
                      ProfileAvatar(image: AppImages.avatar, radius: 30),
                      Column(
                        children: [
                          Text(
                            '21',
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            'Posts',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '2102',
                            style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            'Followers',
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '221',
                            style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            'Followings',
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(30),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lavish Productline',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'lavishproductline@gmail.com | TL0548569 ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 50.h(context),
                            width: 50.h(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(AppImages.cosmetologyLicense),
                                fit: BoxFit.cover,
                              )
                            ),
                          )
                        ],
                      ),
                      const Gap(10),
                      const Text(
                        'The base color of dark blonde is gold, while\nthat of light brown.',
                        style: TextStyle(
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
                            child: const Icon(Icons.add, size: 34,),
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
                              child: SvgPicture.asset(AppSVG.instaIcon),
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
                          Container(
                            height: 70.h(context),
                            width: 70.h(context),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SvgPicture.asset(AppSVG.save),
                            ),
                          ),
                          const Gap(10),
                          Text(
                            'Saved',
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(30),

                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                    ),
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
        ),
        if (watch.showMenu)
        const MenuView(),
      ],
    );
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
