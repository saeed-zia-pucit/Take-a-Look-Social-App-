
import 'package:flutter/cupertino.dart';

class ProfileViewModel extends ChangeNotifier {
  bool showMenu = false;
  void onTapMenu(bool show) {
    showMenu = show;
    notifyListeners();
  }
}