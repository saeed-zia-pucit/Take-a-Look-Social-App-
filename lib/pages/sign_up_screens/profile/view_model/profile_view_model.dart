
import 'package:flutter/cupertino.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/pages/sign_up_screens/profile/data/repo/profile_repo.dart';

class ProfileViewModel extends ChangeNotifier {

  ProfileViewModel(this.profileRepo);
  final ProfileRepo profileRepo;

  bool isLoading = false;
  bool showMenu = false;
  void onTapMenu(bool show) {
    showMenu = show;
    notifyListeners();
  }

  UserModel? currentUser;
  String firstName = '';
  String lastName = '';
  String emailName = '';
  String bio = '';
  String license = '';
  int followersCount = 0;
  int followingsCount = 0;

  Future<void> getUser() async {
    try {
      isLoading = true;
      notifyListeners();
      currentUser = await profileRepo.getUser();
      followersCount = await profileRepo.getFollowersCount() ?? 0;
      followingsCount = await profileRepo.getFollowingsCount() ?? 0;
      print(firstName);
      firstName = currentUser!.firstname ?? '';
      lastName = currentUser!.lastname ?? '';
      emailName = currentUser!.email ?? '';
      bio = currentUser!.bio ?? '';
      license = currentUser!.license ?? '';
      notifyListeners();
    } catch (_) {} finally {
      isLoading = false;
      notifyListeners();
    }
  }

}