
import 'package:dio/dio.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/di_service.dart';

import '../../../../../core/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<UserModel?> getUser();
  Future<UserModel?> getUserById(String userId);
  Future<UserModel> get_User();
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



}
