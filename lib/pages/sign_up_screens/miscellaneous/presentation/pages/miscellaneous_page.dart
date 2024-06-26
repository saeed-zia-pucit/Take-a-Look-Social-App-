
part of 'pages.dart';

class MiscellaneousPage extends StatefulWidget {
  const MiscellaneousPage({super.key});

  @override
  State<MiscellaneousPage> createState() => _MiscellaneousPageState();
}

class _MiscellaneousPageState extends State<MiscellaneousPage> {
  @override
  Widget build(BuildContext context) {
    final read = context.read<MiscellaneousViewModel>();
    final watch = context.watch<MiscellaneousViewModel>();
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'Miscellaneous'
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.settings),
                          text: 'Settings',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () {
                            read.onTapDeleteAccount(true);
                          },
                          text: 'Delete Account ',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.aboutTermPrivacy,
                            extra: AboutTermPrivacyType.about,
                          ),
                          text: 'About the app',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.aboutTermPrivacy,
                            extra: AboutTermPrivacyType.privacy,
                          ),
                          text: 'Privacy policy',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: () => context.push(RouteNames.aboutTermPrivacy,
                            extra: AboutTermPrivacyType.term,
                          ),
                          text: 'Terms and condition ',
                          color: AppColors.greyColor,
                        ),
                        ItemOfProfileMenu(
                          onPressed: (){
                            read.logOut(context);
                          },
                          text: 'Logout',
                          color: AppColors.greyColor,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Center(child: SvgPicture.asset(AppIcons.firstOnboard_2, height: .4.hp(context),))
            ],
          ),
        ),
        if (watch.showDeleteDialog)
          const DeleteAccountView().loadingView(watch.isLoading),
      ],
    );
  }
}
