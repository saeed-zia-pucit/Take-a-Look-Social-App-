import 'package:flutter/cupertino.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/pages/sign_up_screens/profile/data/repo/profile_repo.dart';

import '../../../../core/data/models/user_profile_model.dart';
import '../../../hair_color_formula_screens/follow/view_model/follow_view_model.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(this.profileRepo);

  final ProfileRepo profileRepo;

  bool isLoading = false;
  bool showMenu = false;

  void onTapMenu(bool show) {
    showMenu = show;
    notifyListeners();
  }

  UserModel? currentLoginUser;
  UserModel? currentUser;
  UserProfileModel? currentUserProfile;
  String firstName = '';
  String lastName = '';
  String emailName = '';
  String bio = '';
  String avatarUrl = '';
  String license = '';
  int followersCount = 0;
  int postCount = 0;
  int followingsCount = 0;
  bool isFollower = false;

  Future<void> getUser() async {
    try {
      isLoading = true;
      notifyListeners();
      currentUser = await profileRepo.getUser();
      print(firstName);
      firstName = currentUser!.firstname ?? '';
      lastName = currentUser!.lastname ?? '';
      emailName = currentUser!.email ?? '';
      avatarUrl = currentUser!.avatarUrl ?? '';
      bio = currentUser!.bio ?? '';
      license = currentUser!.license ?? '';
      notifyListeners();

      currentUserProfile =
          await profileRepo.getUserProfileById(currentUser!.id ?? "");
      followersCount = currentUserProfile!.followersCount ?? 0;
      followingsCount = currentUserProfile!.followingCount ?? 0;
      postCount = currentUserProfile!.postCount ?? 0;
      notifyListeners();
      isFollower =
          await checkCurrentUserInFollowers(currentUser!.id ?? "") as bool;
      notifyListeners();
    } catch (_) {
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getUserById(String userId) async {
    try {
      isLoading = true;
      notifyListeners();
      currentUser = await profileRepo.getUserById(userId);
      print(firstName);
      firstName = currentUser!.firstname ?? '';
      lastName = currentUser!.lastname ?? '';
      emailName = currentUser!.email ?? '';
      avatarUrl = currentUser!.avatarUrl ?? '';
      bio = currentUser!.bio ?? '';
      license = currentUser!.license ?? '';
      notifyListeners();
      currentUserProfile =
          await profileRepo.getUserProfileById(currentUser!.id ?? "");
      followersCount = currentUserProfile!.followersCount ?? 0;
      followingsCount = currentUserProfile!.followingCount ?? 0;
      postCount = currentUserProfile!.postCount ?? 0;
      notifyListeners();

      // currentLoginUser = await profileRepo.getUser();
      isFollower =
          await checkCurrentUserInFollowers(currentUser!.id ?? "") as bool;
      notifyListeners();
    } catch (_) {
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  //{"id":"66792bfe289d5301992d344f-667ef1aa89cd9152baee593d","fromId":"66792bfe289d5301992d344f","toId":"667ef1aa89cd9152baee593d"}
  @override
  Future<bool> checkCurrentUserInFollowers(String currentUserId) async {
    // Assuming 'currentUserId' holds the ID of the current user
    // Replace with the actual current user ID
    List<UserModel> followers = [];
    // Wait for the getFollowers method to complete and get the list of followers
    followers = await profileRepo.getFollowersDetails() as List<UserModel>;

    // Check if the current user is in the list of followers
    bool isCurrentUserInFollowers =
        followers.any((follower) => follower.id == currentUserId);

    return isCurrentUserInFollowers;
  }

  Future<bool> unfollowUser(String userId) async {
    return await profileRepo.unfollowUser(userId);
  }

  Future<bool> followUser(String userId) async {
    return await profileRepo.followUser(userId);
  }
}
