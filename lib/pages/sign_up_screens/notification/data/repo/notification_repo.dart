
import 'package:dio/dio.dart';
import 'package:take_a_look/di_service.dart';
import 'package:take_a_look/pages/sign_up_screens/notification/data/models/notification_model.dart';

import '../../../../../core/data/data_source/local/app_local_data.dart';

class NotificationRepo {

  static Dio dio = getIt();

  static Future<List<NotificationModel>> getNotifications(int page, int size) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/notifications?page=$page&size=$size',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => NotificationModel.fromJson(e),).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}