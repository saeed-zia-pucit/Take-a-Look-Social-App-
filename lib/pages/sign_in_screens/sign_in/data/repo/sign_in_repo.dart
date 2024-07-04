
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../core/data/models/user_model.dart';

abstract class SignInRepo {
  Future<UserModel?> signIn(BuildContext context, UserModel userModel);
}

class SignInRepoImpl extends SignInRepo {
  SignInRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<UserModel?> signIn(BuildContext context, UserModel userModel) async {
    try {
      final Response response = await dio.post(
        '${AppLocalData.BaseURL}/auth/login',
        data: userModel.toSignInJson,
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
    } catch (e) {
      return null;
    }
    return null;
  }
}
