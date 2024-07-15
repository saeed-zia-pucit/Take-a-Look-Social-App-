
import 'package:dio/dio.dart';

import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../core/data/models/user_model.dart';
import '../../../../../di_service.dart';

abstract class FollowRepo {
  Future<List<UserModel>> getFollowers(int page, int size);
  Future<List<UserModel>> getFollowings(int page, int size);
  Future<List<UserModel>> getSearchUser(String text, int page, int size);
}

class FollowRepoImpl extends FollowRepo {

  FollowRepoImpl(this.dio);
  final Dio dio;

  @override
  Future<List<UserModel>> getFollowers(int page, int size) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/social/followers?page=$page&size=$size',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => UserModel.fromJsonFollow(e),).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
 
  @override
  Future<List<UserModel>> getFollowings(int page, int size) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/social/following?page=$page&size=$size',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => UserModel.fromJsonFollow(e),).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<UserModel>> getSearchUser(String text, int page, int size) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/users/search?query=$text&page=$page&size=$size',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => UserModel.fromJsonFollow(e),).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

}
