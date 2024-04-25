
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/data/models/color_model.dart';

class HairColorViewModel extends ChangeNotifier {
  String pageTitle = '';
  int currentPageIndex = 0;
  List<bool> colorItemSelect = [];
  List<List<bool>> colorItemsSelect = [];
  PageController pageController = PageController();
  bool isLoadingFormula = false;

  List<ColorModel> naturalLevelColors = [
    // const Color(0xff000000),
    // const Color(0xff251f1f),
    // const Color(0xff331800),
    // const Color(0xff4b2d0d),
    // const Color(0xff624321),
    // const Color(0xff8d634c),
    // const Color(0xffC4A484),
    ColorModel(
      name: "Darkest black",
      color: const Color(0xff000000),
    ),
    const Color(0xff302E2E),
    const Color(0xff4F4C4C),
    const Color(0xff65615D),
    const Color(0xff7F7C75),
    const Color(0xffA09E97),
    const Color(0xffC7C4B4),
    const Color(0xffD7D2C8),
    const Color(0xffEBE8E3),
    const Color(0xffF7F5F0),
  ];

  List<Color> primaryColors = [
    Colors.black,
    Colors.black.withOpacity(.9),
    Colors.black.withOpacity(.8),
    Colors.black.withOpacity(.7),
    Colors.black.withOpacity(.6),
    Colors.black.withOpacity(.5),
    Colors.black.withOpacity(.4),
    Colors.black.withOpacity(.3),
    Colors.black.withOpacity(.2),
    Colors.black.withOpacity(.1),
  ];

  List<Color> desiredTones = [
    const Color(0xffCBC3E3),
    const Color(0xff964B00),
    const Color(0xff5C4033),
    const Color(0xffA0DDAD),
    const Color(0xffFFDF00),
  ];

  List<List<Color>> allColors = [];

  List<Color> selectedColors = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];


  void initPage() {
    pageTitle = 'Natural Level';
    currentPageIndex = 0;
    allColors = [
      naturalLevelColors,
      primaryColors,
      desiredTones,
    ];
    colorItemsSelect = [
      List.generate(naturalLevelColors.length, (index) => false),
      List.generate(primaryColors.length, (index) => false),
      List.generate(desiredTones.length, (index) => false),
    ];
    colorItemSelect = colorItemsSelect.first;
    pageController.jumpToPage(0);
    notifyListeners();
  }

  void onNextStep(int index) {
    if (index == -1) return;
    if (index == 4) return;

    currentPageIndex = index;

    switch (currentPageIndex) {
      case 0: {
        pageTitle = 'Natural Level';

          colorItemSelect = colorItemsSelect[0];
      } break;
      case 1: {
        pageTitle = 'Primary color';

          colorItemSelect = colorItemsSelect[1];
      } break;
      case 2: {
        pageTitle = 'Desired Tones';

          colorItemSelect = colorItemsSelect[2];
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
    colorItemsSelect[pageIndex][index] = true;
    colorItemSelect = colorItemsSelect[pageIndex];
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