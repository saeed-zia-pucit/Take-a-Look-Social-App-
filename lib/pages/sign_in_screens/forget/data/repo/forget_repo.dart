
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ForgetRepo {
  Future<void> sendToEmail(BuildContext context, String email);
}

class ForgetRepoImpl extends ForgetRepo {
  ForgetRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<void> sendToEmail(BuildContext context, String email) async {
    try {
      final Response response = await dio.post(
        '/auth/password-reset',
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
}