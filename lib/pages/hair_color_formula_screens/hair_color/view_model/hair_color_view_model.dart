
import 'package:flutter/material.dart';

class HairColorViewModel extends ChangeNotifier {
  String pageTitle = 'Primary color';
  int currentPageIndex = 0;
  PageController pageController = PageController();

  List<Color> selectedColors = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> primaryColors = [
    const Color.fromRGBO(33, 33, 33, 1),
    const Color.fromRGBO(144, 84, 47, 1),
    const Color.fromRGBO(255, 0, 0, 1),
    const Color.fromRGBO(251, 231, 161, 1),
  ];
  List<Color> naturalLevelColors = [
    const Color.fromRGBO(250, 240, 190, 1),
    const Color.fromRGBO(250, 240, 190, 1),
    const Color.fromRGBO(240, 226, 182, 1),
    const Color.fromRGBO(232, 211, 175, 1),
    const Color.fromRGBO(232, 211, 175, 1),
  ];

  List<Color> desiredColors = [
    const Color.fromRGBO(33, 33, 33, 1),
    const Color.fromRGBO(144, 84, 47, 1),
    const Color.fromRGBO(255, 0, 0, 1),
    const Color.fromRGBO(251, 231, 161, 1),
    const Color.fromRGBO(178, 190, 181, 1),
  ];



  void onNextStep(int index) {
    if (index == 4) return;
    currentPageIndex = index;
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void onTapColorItem(int index, Color color) {
    selectedColors[index] = color;
    notifyListeners();
  }
}