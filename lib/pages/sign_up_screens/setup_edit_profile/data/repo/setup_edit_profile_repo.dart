
import 'package:dio/dio.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/di_service.dart';

abstract class SetupEditProfileRepo {
  Future<UserModel?> updateProfile(UserModel userModel);
}

class SetupEditProfileRepoImpl extends SetupEditProfileRepo {

  SetupEditProfileRepoImpl(this.dio);
  final Dio dio;

  @override
  Future<UserModel?> updateProfile(UserModel userModel) async {
    try {
      String? token = await AppLocalData.getUserToken;
      if (token == null) {
        await AppLocalData.updateToken();
        token = await AppLocalData.getUserToken;
      }
      Response response = await dio.put(
        '/users',
        data: userModel.toJson,
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        UserModel? userModel = UserModel.fromGetUser(response.data);
        return userModel;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
