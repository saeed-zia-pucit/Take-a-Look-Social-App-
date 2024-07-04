import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../di_service.dart';

abstract class ForgetRepo {
  Future<void> sendToEmail(BuildContext context, String email);

  Future<Response?> confirmReset(String email, String otp);
  Future<bool> resetPassword(
      String email, String password, String token);
}

class ForgetRepoImpl extends ForgetRepo {
  ForgetRepoImpl(this.dio);

  final Dio dio;

  @override
  sendToEmail(BuildContext context, String email) async {
    try {
      final Response response = await dio.post(
        '${AppLocalData.BaseURL}/auth/reset/request',
        options: Options(headers: header),
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<Response?> confirmReset(String email, String otp) async {
    try {
      var response = await dio.post(
        '${AppLocalData.BaseURL}/auth/reset/confirm',
        options: Options(
          headers: header,
        ),
        data: {
          'email': email,
          'otp': otp,
        },
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        print('Failed to confirm reset. Status code: ${response.statusCode}');
        return response;
      }
    } catch (e) {
      print('Failed to confirm reset. Error: $e');
      return null;
    }
  }
@override
Future<bool> resetPassword(String email, String password, String token) async {
  try {
    var response = await dio.put(
      '${AppLocalData.BaseURL}/auth/reset',
      options: Options(
        headers: header,
      ),
      data: {
        "email": email,
        "token": token,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to confirm reset. Status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Failed to confirm reset. Error: $e');
    return false;
  }
}
}
