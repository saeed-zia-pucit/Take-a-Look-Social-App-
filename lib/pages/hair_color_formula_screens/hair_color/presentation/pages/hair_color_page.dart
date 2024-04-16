
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/presentation/widgets/primary_color.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          read.pageTitle
        ),
        actions: [
          TextButton(
            onPressed: (){},
            child: Text('Steps ${read.currentPageIndex+1}/4'),
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
                  hairColorPageType: HairColorPageType.primaryColor,
                  selectedColor: watch.selectedColors[0],
                ),
                ShowColor(
                  title: 'Choose client natural level',
                  chooseColorTitle: 'Lighter Blonde',
                  hairColorPageType: HairColorPageType.naturalLevel,
                  selectedColor: watch.selectedColors[1],
                ),
                ShowColor(
                  title: 'Choose client desired color',
                  chooseColorTitle: 'Ashes',
                  hairColorPageType: HairColorPageType.desiredColor,
                  selectedColor: watch.selectedColors[2],
                ),
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
              onPressed: (){
                read.onNextStep(read.currentPageIndex+1);
              },
              child: const Text('next'),
            ),
          ),
        ],
      ),

    );
  }
}

enum HairColorPageType {
  primaryColor,
  naturalLevel,
  desiredColor,
}

extension HairColorPageTypeExtension on HairColorPageType {
  bool get isPrimaryColor => HairColorPageType.primaryColor == this;
  bool get isNaturalLevel => HairColorPageType.naturalLevel == this;
  bool get isDesiredColor => HairColorPageType.desiredColor == this;
}
