
import 'package:flutter/cupertino.dart';

class MiscellaneousViewModel extends ChangeNotifier {
  bool showDeleteDialog = false;
  void onTapDeleteAccount(bool show) {
    showDeleteDialog = show;
    notifyListeners();
  }
}