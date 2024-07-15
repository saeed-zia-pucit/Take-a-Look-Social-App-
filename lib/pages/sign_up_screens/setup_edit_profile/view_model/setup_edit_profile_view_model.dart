
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/pages/sign_up_screens/profile/data/repo/profile_repo.dart';
import 'package:take_a_look/pages/sign_up_screens/setup_edit_profile/data/repo/setup_edit_profile_repo.dart';
import 'package:take_a_look/pages/sign_up_screens/setup_edit_profile/presentation/pages/pages.dart';

import '../../../../core/router/router.dart';
import '../../../../di_service.dart';
import '../../../hair_color_formula_screens/home_feed/presentation/pages/pages.dart';

class SetupEditProfileViewModel extends ChangeNotifier {

  SetupEditProfileViewModel(this.setupEditProfileRepo);
  final SetupEditProfileRepo setupEditProfileRepo;

  bool isLoading = false;
  XFile? image;

  void uploadLicense() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  bool isStudent = false;
  void onTapStudent() {
    isStudent = !isStudent;
    notifyListeners();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  String avatarUrl = '';
  Future<void> getProfile() async {
    try {
      isLoading = true;
      notifyListeners();
      UserModel? userModel = await getIt<ProfileRepo>().getUser();
      firstNameController.text = userModel?.firstname ?? '';
      lastNameController.text = userModel?.lastname ?? '';
      emailController.text = userModel?.email ?? '';
      avatarUrl = userModel?.avatarUrl ?? '';
      bioController.text = userModel?.bio ?? '';
      licenseController.text = userModel?.license ?? '';
    } catch (_) {} finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile(BuildContext context, SetupEditProfileType profileType) async {

    UserModel? userModel;
      userModel = UserModel(
        firstname: firstNameController.text.trim(),
        lastname: lastNameController.text.trim(),
        email: emailController.text.trim(),
        bio: bioController.text.trim(),
        license: (isStudent) ? '' : licenseController.text.trim(),
      );
    await setupEditProfileRepo.updateProfile(userModel);
    if (profileType.isEdit) {
      context.pop();
    } else {
      context.go(
        RouteNames.homeFeed,
        extra: HomeFeedPageType.feed,
      );
    }
  }

}
