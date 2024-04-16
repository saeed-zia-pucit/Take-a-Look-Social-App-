
import 'package:flutter/cupertino.dart';

class HairColorViewModel extends ChangeNotifier {
  String pageTitle = 'Primary color';
  int currentStep = 1;
  PageController pageController = PageController();

  void onNextStep(int step) {
    currentStep++;
    pageController.jumpToPage(step);
    notifyListeners();
  }
}