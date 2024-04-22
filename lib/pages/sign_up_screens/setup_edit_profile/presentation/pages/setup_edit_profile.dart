
part of 'pages.dart';

class SetupEditProfilePage extends StatefulWidget {
  const SetupEditProfilePage({super.key, required this.profileType});

  final SetupEditProfileType profileType;

  @override
  State<SetupEditProfilePage> createState() => _SetupEditProfilePageState();
}

class _SetupEditProfilePageState extends State<SetupEditProfilePage> {

  late SetupEditProfileType profileType;

  @override
  void initState() {
    profileType = widget.profileType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (profileType.isSetup) ?
          'Lets setup your profile' :
          'Edit Profile',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              const Gap(30),
              AvatarWithRadius(
                radius: 60.h(context),
                image: AppImages.avatar,
              ),
              TextButton(
                onPressed: (){},
                child: const Text('Upload Picture'),
              ),
              const Gap(30),

              if (profileType.isEdit)
              const Column(
                children: [
                  TextFieldWithTitle(
                    title: 'First Name',
                    titleColor: Colors.black,
                  ),
                  Gap(30),

                  TextFieldWithTitle(
                    title: 'Last Name',
                    titleColor: Colors.black,
                  ),
                  Gap(30),

                  TextFieldWithTitle(
                    title: 'Email',
                    titleColor: Colors.black,
                  ),
                  Gap(30),
                ],
              ),

              const TextFieldWithTitle(
                title: 'Tell as about yourself',
                titleColor: Colors.black,
                hintText: 'Add Bio',
                maxLines: 5,
              ),
              const Gap(30),
              const TextFieldWithTitle(
                title: 'Cosmetology License Number',
                titleColor: Colors.black,
              ),
              const Gap(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Upload License'),
                  const Gap(5),
                  InkWell(
                    onTap: (){},
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      dashPattern: const [5],
                      color: AppColors.greyColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 100.h(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                ' Click here to upload',
                                style: GoogleFonts.nunito(color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(60),
              ElevatedButton(
                onPressed: () =>
                (profileType.isSetup) ?
                context.go(
                  RouteNames.homeFeed,
                  extra: HomeFeedPageType.feed
                  // extra: ProfilePageType.mine,
                ) :
                context.pop(),
                child: const Text('Submit'),
              ),
              const Gap(50),
            ],
          ),
        ),
      ),

    );
  }
}

enum SetupEditProfileType {
  setup, edit,
}

extension SetupEditProfileTypeExtension on SetupEditProfileType {
  bool get isSetup => SetupEditProfileType.setup == this;
  bool get isEdit => SetupEditProfileType.edit == this;
}
