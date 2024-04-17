
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/constants/app_icons.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_formula/presentation/widgets/hair_view.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_formula/presentation/widgets/selected_colors.dart';

class HairFormula extends StatefulWidget {
  const HairFormula({super.key, required this.colors});

  final List<Color> colors;

  @override
  State<HairFormula> createState() => _HairFormulaState();
}

class _HairFormulaState extends State<HairFormula> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hair Formula'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(CupertinoIcons.heart),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedColors(colors: widget.colors),
            const HairView(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('URL'),
                  const Gap(20),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [5],
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'https//play.google.com/store/apps/details?..'
                          ),
                          TextButton(
                            onPressed: (){},
                            child: const Text('Copy'),
                          )
                        ],
                      ),
                    ),
                  ),

                  const Gap(30),
                  const Text('Video'),
                  const Gap(20),
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(AppImages.forgetBackground),
                        fit: BoxFit.cover
                      )
                    ),
                    child: SvgPicture.asset(AppIcons.playIcon),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
