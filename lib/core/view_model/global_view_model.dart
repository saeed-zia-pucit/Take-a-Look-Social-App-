
import 'package:flutter/cupertino.dart';

class GlobalViewModel extends ChangeNotifier {
  bool isMenuOpen = false;
  void menuControl({required bool open}) {
    isMenuOpen = open;
    notifyListeners();
  }
}