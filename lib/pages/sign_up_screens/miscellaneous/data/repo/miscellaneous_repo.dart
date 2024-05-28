
import 'package:dio/dio.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/di_service.dart';
import 'package:take_a_look/pages/sign_up_screens/profile/data/repo/profile_repo.dart';

abstract class MiscellaneousRepo {
  Future<bool> deleteAccount();
}

class MiscellaneousRepoImpl extends MiscellaneousRepo {

  MiscellaneousRepoImpl(this.dio);
  final Dio dio;

  @override
  Future<bool> deleteAccount() async {
    try {
      String? token = await AppLocalData.getUserToken;
      if (token == null) {
        await AppLocalData.updateToken();
        token = await AppLocalData.getUserToken;
      }
      UserModel? userModel = await getIt<ProfileRepo>().getUser();
      Response response = await dio.delete(
        '/users',
        data: {
          'id' : userModel!.id,
        },
        options: Options(
          headers: headerWithAuth(token),
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
