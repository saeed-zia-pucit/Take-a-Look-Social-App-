part of 'pages.dart';

class SetupEditProfilePage extends StatefulWidget {
  const SetupEditProfilePage({
    super.key,
    required this.profileType,
  });

  final SetupEditProfileType profileType;

  @override
  State<SetupEditProfilePage> createState() => _SetupEditProfilePageState();
}

class _SetupEditProfilePageState extends State<SetupEditProfilePage> {
  late SetupEditProfileType profileType;

  var imageUri = AppImages.avatar;

  @override
  void initState() {
    profileType = widget.profileType;
    context.read<SetupEditProfileViewModel>().getProfile();
    super.initState();
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    final read = context.read<SetupEditProfileViewModel>();
    final watch = context.watch<SetupEditProfileViewModel>();
    if (i == 0) {
      imageUri = read.avatarUrl.isEmpty ? AppImages.avatar : read.avatarUrl;
      i++;
      if (read.avatarUrl.isNotEmpty) {
        imageUri= read.avatarUrl;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (profileType.isSetup) ? 'Lets setup your profile' : 'Edit Profile',
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
                image: imageUri,
              ),
              TextButton(
                onPressed: () async {
                  final option = await showModalBottomSheet<ImageSourceOption>(
                    context: context,
                    builder: (context) => Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.photo_library,
                              color: AppColors.primaryColor),
                          title: Text('Pick from gallery'),
                          onTap: () =>
                              Navigator.pop(context, ImageSourceOption.gallery),
                        ),
                        ListTile(
                          leading: Icon(Icons.camera_alt,
                              color: AppColors.primaryColor),
                          title: Text('Take a photo'),
                          onTap: () =>
                              Navigator.pop(context, ImageSourceOption.camera),
                        ),
                      ],
                    ),
                  );

                  selectImage(option!);
                },
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
                      controller: read.licenseController,
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
                      onTap: () {
                        context
                            .read<SetupEditProfileViewModel>()
                            .uploadLicense();
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
                                  style: GoogleFonts.nunito(
                                      color: AppColors.primaryColor),
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

  late File _selectedImage;

  Future<void> selectImage(ImageSourceOption sourceOption) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: sourceOption == ImageSourceOption.gallery
          ? ImageSource.gallery
          : ImageSource.camera,
    );

    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      //uploading  meassage

      uploadImage(_selectedImage);
    }
  }

  Future<void> uploadImage(File imageFile) async {
    final uri = Uri.parse('${AppLocalData.BaseURL}/users/avatar');
    await AppLocalData.updateToken();
    final token = await AppLocalData.getUserToken;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Uploading, Please wait!'),
      ),
    );
    final request = http.MultipartRequest('PUT', uri)
      ..headers['accept'] = '*/*'
      ..headers['Authorization'] =
          'Bearer $token' // Replace YOUR_ACCESS_TOKEN with your actual token
      ..headers['Content-Type'] = 'multipart/form-data'
      ..files.add(await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      // Assuming jsonResponse is the JSON object you received
      Map<String, dynamic> jsonResponse = jsonDecode(responseString);

// Extracting id and avatarUrl from the jsonResponse
      String id = jsonResponse['id'];
      String avatarUrl = jsonResponse['avatarUrl'];

// Printing both to console for verification
      print('ID: $id');
      print('Avatar URL: $avatarUrl');
      setState(() {
        imageUri = avatarUrl;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully uploaded!'),
        ),
      );
      // Handle your response or assign it to some state variable as needed
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to upload!'),
        ),
      );
      print('Failed to upload image. Status code: ${response.statusCode}');
      // Handle error
    }
  }
}

enum SetupEditProfileType {
  setup,
  edit,
}

extension SetupEditProfileTypeExtension on SetupEditProfileType {
  bool get isSetup => SetupEditProfileType.setup == this;

  bool get isEdit => SetupEditProfileType.edit == this;
}
