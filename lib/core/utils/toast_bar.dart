
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:take_a_look/constants/app_colors.dart';

class Utils {
  static void showToast(String msg) {
    FocusManager.instance.primaryFocus!.unfocus();
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}