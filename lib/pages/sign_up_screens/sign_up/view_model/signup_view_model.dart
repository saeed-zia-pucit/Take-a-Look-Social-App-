
import 'package:flutter/cupertino.dart';

class SignUpViewModel extends ChangeNotifier {
  bool isAgree = false;
  void onTapPrivacyPolicyBox() {
    isAgree = !isAgree;
    notifyListeners();
  }
}