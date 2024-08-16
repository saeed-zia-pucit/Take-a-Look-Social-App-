import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/data/models/color_model.dart';

class HairColorViewModel extends ChangeNotifier {
  String pageTitle = '';
  String selectedColorName = '';
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
    ColorModel(
      name: "Black",
      color: const Color(0xff302E2E),
    ),
    ColorModel(
      name: "Darkest Brown",
      color: const Color(0xff4F4C4C),
    ),
    ColorModel(
      name: "Dark Brown",
      color: const Color(0xff65615D),
    ),
    ColorModel(
      name: "Medium Brown",
      color: const Color(0xff7F7C75),
    ),
    ColorModel(
      name: "Medium Light Brown",
      color: const Color(0xffA09E97),
    ),
    ColorModel(
      name: "Lightest Brown",
      color: const Color(0xffC7C4B4),
    ),
    ColorModel(
      name: "Dark Blonde",
      color: const Color(0xffD7D2C8),
    ),
    ColorModel(
      name: "Medium Blonde",
      color: const Color(0xffEBE8E3),
    ),
    ColorModel(
      name: "Lightest Blonde",
      color: const Color(0xffF7F5F0),
    ),
  ];

  // List<ColorModel> primaryColors = [
  //   ColorModel(
  //     name: "1",
  //     color: Colors.black,
  //   ),
  //   ColorModel(
  //     name: "2",
  //     color: Colors.black.withOpacity(.9),
  //   ),
  //   ColorModel(
  //     name: "3",
  //     color: Colors.black.withOpacity(.8),
  //   ),
  //   ColorModel(
  //     name: "4",
  //     color: Colors.black.withOpacity(.7),
  //   ),
  //   ColorModel(
  //     name: "5",
  //     color: Colors.black.withOpacity(.6),
  //   ),
  //   ColorModel(
  //     name: "6",
  //     color: Colors.black.withOpacity(.5),
  //   ),
  //   ColorModel(
  //     name: "7",
  //     color: Colors.black.withOpacity(.4),
  //   ),
  //   ColorModel(
  //     name: "8",
  //     color: Colors.black.withOpacity(.3),
  //   ),
  //   ColorModel(
  //     name: "9",
  //     color: Colors.black.withOpacity(.2),
  //   ),
  //   ColorModel(
  //     name: "10",
  //     color: Colors.black.withOpacity(.1),
  //   ),
  // ];
  List<ColorModel> primaryColors = [
    ColorModel(
      name: "1",
      color: const Color(0xff2b191c),
    ),
    ColorModel(
      name: "2",
      color: const Color(0xff6b4622),
    ),
    ColorModel(
      name: "3",
      color: const Color(0xff7a6761),
    ),
    ColorModel(
      name: "4",
      color: const Color(0xff301a24),
    ),
    ColorModel(
      name: "5",
      color: const Color(0xff322d2a),
    ),
    ColorModel(
      name: "6",
      color: const Color(0xff432e2e),
    ),
    ColorModel(
      name: "7",
      color: const Color(0xff633c1f),
    ),
    ColorModel(
      name: "8",
      color: const Color(0xff683e1a),
    ),
    ColorModel(
      name: "9",
      color: const Color(0xff731c23),
    ),
    ColorModel(
      name: "10",
      color: const Color(0xff50424c),
    ),
    ColorModel(
      name: "11",
      color: const Color(0xff59231d),
    ),
    ColorModel(
      name: "12",
      color: const Color(0xff533833),
    ),
    ColorModel(
      name: "13",
      color: const Color(0xffb20f18),
    ),
    ColorModel(
      name: "14",
      color: const Color(0xffbc6c2f),
    ),
    ColorModel(
      name: "15",
      color: const Color(0xff1e3d36),
    ),
    ColorModel(
      name: "16",
      color: const Color(0xffd36d5d),
    ),
    ColorModel(
      name: "17",
      color: const Color(0xff8f3018),
    ),
    ColorModel(
      name: "18",
      color: const Color(0xffee1b27),
    ),
    ColorModel(
      name: "19",
      color: const Color(0xfff7712a),
    ),
    ColorModel(
      name: "20",
      color: const Color(0xfffdd93a),
    ),

  ];

  List<ColorModel> desiredTones = [
    ColorModel(
      name: "Cool (light purple)",
      color: const Color(0xffCBC3E3),
    ),
    /*ColorModel(
      name: "Warm (brown)",
      color: const Color(0xff964B00),
    ),
    ColorModel(
      name: "Neutral (dark brown)",
      color: const Color(0xff5C4033),
    ),
    ColorModel(
      name: "Ash (green)",
      color: const Color(0xffA0DDAD),
    ),
    ColorModel(
      name: "Golden (yellow)",
      color: const Color(0xffFFDF00),
    ),*/
  ];

  List<List<ColorModel>> allColors = [];

  List<ColorModel> selectedColors = [
    ColorModel(
      name: '',
      color: Colors.white,
    ),
    ColorModel(
      name: '',
      color: Colors.white,
    ),
    /*ColorModel(
      name: '',
      color: Colors.white,
    ),*/
  ];

  void initPage() {
    pageTitle = 'Natural Level';
    currentPageIndex = 0;
    allColors = [
      naturalLevelColors,
      primaryColors,
      // desiredTones,
    ];
    selectedColors = [
      ColorModel(name: '', color: Colors.white),
      ColorModel(name: '', color: Colors.white),
      // ColorModel(name: '', color: Colors.white),
    ];
    colorItemsSelect = [
      List.generate(naturalLevelColors.length, (index) => false),
      List.generate(primaryColors.length, (index) => false),
      // List.generate(desiredTones.length, (index) => false),
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
      case 0:
        {
          pageTitle = 'Natural Level';
          selectedColorName = selectedColors[0].name;
          colorItemSelect = colorItemsSelect[0];
        }
        break;
      case 1:
        {
          // pageTitle = 'Primary color';
          pageTitle = 'Desired Tones';
          selectedColorName = selectedColors[1].name;
          colorItemSelect = colorItemsSelect[1];
        }
        break;
      /* case 2: {
        pageTitle = 'Desired Tones';
        selectedColorName = selectedColors[2].name;
        colorItemSelect = colorItemsSelect[2];
      } break;*/
      case 2:
        {
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

  void onTapColorItem(int index, int pageIndex, ColorModel colorModel) {
    colorItemsSelect[pageIndex] =
        List.generate(colorItemsSelect[pageIndex].length, (index) => false);
    colorItemsSelect[pageIndex][index] = true;
    colorItemSelect = colorItemsSelect[pageIndex];
    selectedColors[pageIndex] = colorModel;
    selectedColorName = allColors[pageIndex][index].name;
    notifyListeners();
  }

  void onSubmit(BuildContext context, bool isStart) {
    isLoadingFormula = isStart;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      isLoadingFormula = false;
      context.go(RouteNames.hairFormula, extra: selectedColors);
    });
    notifyListeners();
  }

  void updateSelectedColor(
      int index, Color color, List<ColorModel> selectedColors) {
    selectedColors[index].color = color;
    notifyListeners();
  }
}
