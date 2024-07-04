
import 'package:dio/dio.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/core/data/models/user_model.dart';

abstract class SignUpRepo {
  Future<UserModel?> signUp(UserModel userModel);
}

class SignUpRepoImpl extends SignUpRepo {

  SignUpRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<UserModel?> signUp(UserModel userModel) async {
    try {
      final Response response = await dio.post(
        '/auth/signup?provider=TAKELOOK',
        data: userModel.toSignUpJson,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);


        UserModel userModelIn = UserModel.fromSignUp(response.data);
        UserModel userModelFull = userModel.copyWith(
          token: userModelIn.token,
          refreshToken: userModelIn.refreshToken,
        );

        await AppLocalData.saveUserModel(userModelFull);
        await AppLocalData.saveUserToken(userModelFull.token);
        await AppLocalData.saveUserRefreshToken(userModelFull.refreshToken);

        return userModelFull;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

}
