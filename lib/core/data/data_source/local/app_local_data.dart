
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:take_a_look/core/data/models/user_model.dart';

class AppLocalData {
  static Box<dynamic> box = Hive.box('appBox');

  static Future<void> saveUserToken(String? token) async {
    await box.put('token', token);
    // const storage = FlutterSecureStorage();
    // await storage.write(key: 'token', value: token);
  }

  static Future<String?> get getUserToken async {
    return await box.get('token');
    // const storage = FlutterSecureStorage();
    // String? token = await storage.read(key: 'token');
    // return token;
  }

  static Future<void> saveUserRefreshToken(String? refreshToken) async {
    await box.put('refreshToken', refreshToken);
  }

  static Future<String?> get getUserRefreshToken async {
    return await box.get('refreshToken');
  }
  static Future<void> saveUserModel(UserModel? userModel) async {
    await box.put('userModel', userModel?.toJson.toString());
  }

  static Future<UserModel?> get getUserModel async {
    var source = await box.get('userModel');
    UserModel? userModel = UserModel.fromJson(jsonDecode(source));
    return userModel;
  }

  static Future<void> removeAll() async {
    await box.deleteAll([
      'token',
      'refreshToken',
      'userModel',
    ]);
  }



  static Future<void> updateToken() async {
    String? refreshToken = await getUserRefreshToken;
    if (refreshToken == null) return;
    Dio dio = Dio();
    Response response = await dio.post(
      'http://18.218.231.128:8445/api/auth/refresh',
      data: {
        'token' : refreshToken,
      },
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        }
      ),
    );

    if (response.statusCode == 200) {
      print('TOKEN: ${response.data['token']}');
      print('REFRESHTOKEN: ${response.data['refreshToken']}');
      await saveUserToken(response.data['token']);
      await saveUserRefreshToken(response.data['refreshToken']);
    }

  }

}