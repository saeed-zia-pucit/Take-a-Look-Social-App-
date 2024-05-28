
part of 'pages.dart';

class SetupEditProfilePage extends StatefulWidget {
  const SetupEditProfilePage({super.key,
    required this.profileType,
  });

  final SetupEditProfileType profileType;

  @override
  State<SetupEditProfilePage> createState() => _SetupEditProfilePageState();
}

class _SetupEditProfilePageState extends State<SetupEditProfilePage> {

  late SetupEditProfileType profileType;

  @override
  void initState() {
    profileType = widget.profileType;
    context.read<SetupEditProfileViewModel>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final read = context.read<SetupEditProfileViewModel>();
    final watch = context.watch<SetupEditProfileViewModel>();

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
        padding: const EdgeInsets.symmetric(vertical: 30),
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
              Column(
                children: [
                  TextFieldWithTitle(
                    controller: read.firstNameController,
                    title: 'First Name',
                    titleColor: Colors.black,
                  ),
                  Gap(30),

                  TextFieldWithTitle(
                    controller: read.lastNameController,
                    title: 'Last Name',
                    titleColor: Colors.black,
                  ),
                  Gap(30),

                  TextFieldWithTitle(
                    controller: read.emailController,
                    title: 'Email',
                    titleColor: Colors.black,
                  ),
                  Gap(30),
                ],
              ),

              TextFieldWithTitle(
                controller: read.bioController,
                title: 'Tell as about yourself',
                titleColor: Colors.black,
                hintText: 'Add Bio',
                maxLines: 5,
              ),


              if (!watch.isStudent)
              Column(
                children: [
                  const Gap(30),
                  TextFieldWithTitle(
                    controller:  read.licenseController,
                    title: 'Cosmetology License Number',
                    titleColor: Colors.black,
                    enable: !watch.isStudent,
                  ),
                ],
              ),

              if (!watch.isStudent)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(30),
                  const Text('Upload License'),
                  const Gap(5),
                  InkWell(
                    onTap: (){
                      context.read<SetupEditProfileViewModel>().uploadLicense();
                    },
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

              const Gap(30),
              GestureDetector(
                onTap: () {
                  read.onTapStudent();
                },
                child: Row(
                  children: [
                    Checkbox(
                      onChanged: (_) => read.onTapStudent(),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: watch.isStudent,
                    ),
                    const Text('Cosmetology Student'),
                  ],
                ),
              ),

              const Gap(60),
              ElevatedButton(
                onPressed: () async {
                  await read.updateProfile(context, profileType);
                  context.read<ProfileViewModel>().getUser();
                },
                child: const Text('Submit'),
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    ).loadingView(read.isLoading && read.emailController.text.isEmpty);
  }
}

enum SetupEditProfileType {
  setup, edit,
}

extension SetupEditProfileTypeExtension on SetupEditProfileType {
  bool get isSetup => SetupEditProfileType.setup == this;
  bool get isEdit => SetupEditProfileType.edit == this;
}
