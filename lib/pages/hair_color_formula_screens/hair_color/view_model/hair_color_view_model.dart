
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/router/router.dart';

class HairColorViewModel extends ChangeNotifier {
  String pageTitle = 'Primary color';
  int currentPageIndex = 0;
  List<bool> colorItemSelect = [];
  List<List<bool>> colorItemsSelect = [];
  PageController pageController = PageController();
  bool isLoadingFormula = false;

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

  List<List<Color>> allColors = [];

  List<Color> selectedColors = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];


  void initPage() {
    pageTitle = 'Primary color';
    currentPageIndex = 0;
    allColors = [
      primaryColors,
      naturalLevelColors,
      desiredColors,
    ];
    colorItemsSelect = [
      List.generate(primaryColors.length, (index) => false),
      List.generate(naturalLevelColors.length, (index) => false),
      List.generate(desiredColors.length, (index) => false),
    ];

    print(colorItemsSelect);

    colorItemSelect = colorItemsSelect.first;
    notifyListeners();
  }

  void onNextStep(int index) {
    if (index == 4) return;

    currentPageIndex = index;

    switch (currentPageIndex) {
      case 0: {
        pageTitle = 'Primary color';

        // if (colorItemsSelect[0].isEmpty) {
        //   colorItemsSelect[0] = List.generate(primaryColors.length, (index) => false);
          colorItemSelect = colorItemsSelect[0];
        // }
      } break;
      case 1: {
        pageTitle = 'Natural Level';

        // if (colorItemsSelect[1].isEmpty) {
        //   colorItemsSelect[1] = List.generate(naturalLevelColors.length, (index) => false);
          colorItemSelect = colorItemsSelect[1];
        // }
      } break;
      case 2: {
        pageTitle = 'Desired Color';

        // if (colorItemsSelect[2].isEmpty) {
        //   colorItemsSelect[2] = List.generate(desiredColors.length, (index) => false);
          colorItemSelect = colorItemsSelect[2];
        // }
      } break;
      case 3: {
        pageTitle = 'Get Formula';
      }

    }
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void onTapColorItem(int index, int pageIndex, Color color) {
    colorItemsSelect[pageIndex] = List.generate(colorItemsSelect[pageIndex].length, (index) => false);
    print(colorItemsSelect);
    colorItemsSelect[pageIndex][index] = true;
    print(colorItemsSelect);
    colorItemSelect = colorItemsSelect[pageIndex];
    print(colorItemSelect);
    selectedColors[pageIndex] = color;
    notifyListeners();
  }

  void onSubmit(BuildContext context, bool isStart) {
    isLoadingFormula = isStart;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      isLoadingFormula = false;
      context.go(
        RouteNames.hairFormula,
        extra: selectedColors
      );
    });
    notifyListeners();
  }
}