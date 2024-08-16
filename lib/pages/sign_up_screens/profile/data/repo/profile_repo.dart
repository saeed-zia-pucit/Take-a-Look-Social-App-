import 'package:dio/dio.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/di_service.dart';

import '../../../../../core/data/models/user_model.dart';
import '../../../../../core/data/models/user_profile_model.dart';
import '../../../../hair_color_formula_screens/follow/data/repo/follow_repo.dart';

abstract class ProfileRepo {
  Future<UserModel?> getUser();

  Future<UserModel?> getUserById(String userId);

  Future<List<UserModel>?> getFollowersDetails();

  Future<UserProfileModel?> getUserProfileById(String userId);

  Future<UserModel> get_User();

  Future<bool> followUser(String userId);

  Future<bool> unfollowUser(String userId);

  Future<int?> getFollowingsCount(String? id);

  Future<int?> getFollowersCount(String? id);
}

class ProfileRepoImpl extends ProfileRepo {
  ProfileRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<UserModel?> getUser() async {
    await AppLocalData.updateToken();
    final token = await AppLocalData.getUserToken;
    Response response = await dio.get(
      '/users',
      options: Options(
        headers: headerWithAuth(token),
      ),
    );
    if ((response.statusCode == 200) || (response.statusCode == 201)) {
      return UserModel.fromGetUser(response.data);
    }
    return null;
  }

  @override
  Future<UserModel?> getUserById(String userId) async {
    await AppLocalData.updateToken();
    final token = await AppLocalData.getUserToken;
    Response response = await dio.get(
      '/users/$userId',
      options: Options(
        headers: headerWithAuth(token),
      ),
    );
    if ((response.statusCode == 200) || (response.statusCode == 201)) {
      return UserModel.fromGetUser(response.data);
    }
    return null;
  }

  @override
  Future<UserProfileModel?> getUserProfileById(String userId) async {
    await AppLocalData.updateToken();
    final token = await AppLocalData.getUserToken;
    Response response = await dio.get(
      '/users/profile/$userId',
      options: Options(
        headers: headerWithAuth(token),
      ),
    );
    if ((response.statusCode == 200) || (response.statusCode == 201)) {
      return UserProfileModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<List<UserModel>> getFollowersDetails() async {
    return FollowRepoImpl(dio).getFollowings(0, 100);
  }

  @override
  Future<UserModel> get_User() async {
    await AppLocalData.updateToken();
    final token = await AppLocalData.getUserToken;
    Response response = await dio.get(
      '/users',
      options: Options(
        headers: headerWithAuth(token),
      ),
    );
    if ((response.statusCode == 200) || (response.statusCode == 201)) {
      return UserModel.fromGetUser(response.data);
    }
    return UserModel();
  }

  @override
  Future<int?> getFollowingsCount(String? id) async {
    final token = await AppLocalData.getUserToken;
    // await AppLocalData.updateToken();
    Response response = await dio.get(
      '/social/id/following/count',
      options: Options(
        headers: headerWithAuth(token),
      ),
    );
    if (response.statusCode == 200) {
      return response.data['count'];
    }

    return null;
  }

  @override
  Future<int?> getFollowersCount(String? id) async {
    final token = await AppLocalData.getUserToken;
    // await AppLocalData.updateToken();
    Response response = await dio.get(
      '/social/id/followers/count',
      options: Options(
        headers: headerWithAuth(token),
      ),
    );
    if (response.statusCode == 200) {
      return response.data['count'];
    }

    return null;
  }

  @override
  Future<bool> followUser(String userId) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        '${AppLocalData.BaseURL}/social/follow/$userId',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then the content was successfully liked.
        print('Content was successfully liked.');
        return true;
      } else {
        // If the server returns a response with a status code other than 200, then something went wrong.
        print('Failed to like content. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to like content. Error: $e');
      return false;
    }
  }

  @override
  Future<bool> unfollowUser(String userId) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        '${AppLocalData.BaseURL}/social/unfollow/$userId',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then the content was successfully unliked.
        print('Content was successfully unliked.');
        return true;
      } else {
        // If the server returns a response with a status code other than 200, then something went wrong.
        print('Failed to unlike content. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to unlike content. Error: $e');
      return false;
    }
  }
}
