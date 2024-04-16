
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/presentation/widgets/fetching_hair_formula.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/presentation/widgets/get_formula.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/presentation/widgets/show_color.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/view_model/hair_color_view_model.dart';

class HairColorPage extends StatefulWidget {
  const HairColorPage({super.key});

  @override
  State<HairColorPage> createState() => _HairColorPageState();
}

class _HairColorPageState extends State<HairColorPage> {
  @override
  Widget build(BuildContext context) {
  final read = context.read<HairColorViewModel>();
  final watch = context.watch<HairColorViewModel>();

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              read.pageTitle
            ),
            actions: [
              if (read.currentPageIndex != 3)
              TextButton(
                onPressed: (){},
                child: Text('Steps ${read.currentPageIndex+1}/4'),
              ) else
              TextButton(
                onPressed: (){},
                child: const Text('Reset'),
              )
            ],
          ),

          body: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    read.onNextStep(index);
                  },
                  controller: read.pageController,
                  children: [
                    ShowColor(
                      title: 'Select client current color',
                      chooseColorTitle: 'Blonde',
                      selectedColor: watch.selectedColors[0],
                      hairColorPageType: HairColorPageType.primaryColor,
                    ),
                    ShowColor(
                      title: 'Choose client natural level',
                      chooseColorTitle: 'Lighter Blonde',
                      selectedColor: watch.selectedColors[1],
                      hairColorPageType: HairColorPageType.naturalLevel,
                    ),
                    ShowColor(
                      title: 'Choose client desired color',
                      chooseColorTitle: 'Ashes',
                      selectedColor: watch.selectedColors[2],
                      hairColorPageType: HairColorPageType.desiredColor,
                    ),
                    GetFormula(
                      colors: watch.selectedColors,
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  vertical: context.bottomHeight,
                  horizontal: 20,
                ),
                child: ElevatedButton(
                  onPressed: (watch.currentPageIndex == 3) ? (){
                    read.onSubmit(context, true);
                  } : () {
                    read.onNextStep(read.currentPageIndex+1);
                  },
                  child: Text(
                    (watch.currentPageIndex == 3) ?
                    'Submit' : 'Next',
                  ),
                ),
              ),
            ],
          ),

        ),
        if (watch.isLoadingFormula)
        const FetchingHairFormula()
      ],
    );
  }
}

enum HairColorPageType {
  primaryColor,
  naturalLevel,
  desiredColor,
  getFormula,
}

extension HairColorPageTypeExtension on HairColorPageType {
  bool get isPrimaryColor => HairColorPageType.primaryColor == this;
  bool get isNaturalLevel => HairColorPageType.naturalLevel == this;
  bool get isDesiredColor => HairColorPageType.desiredColor == this;
  bool get isGetFormula => HairColorPageType.getFormula == this;
}
