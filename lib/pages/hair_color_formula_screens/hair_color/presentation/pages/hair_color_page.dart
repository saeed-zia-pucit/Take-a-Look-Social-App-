
part of 'pages.dart';

class HairColorPage extends StatefulWidget {
  const HairColorPage({super.key});

  @override
  State<HairColorPage> createState() => _HairColorPageState();
}

class _HairColorPageState extends State<HairColorPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HairColorViewModel>().initPage();
    });
    super.initState();
  }

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
            leading: (watch.currentPageIndex == 0) ?
            IconButton(
              onPressed: (){
                context.read<GlobalViewModel>().menuControl(open: true);
              },
              icon: const Icon(Icons.sort),
            ) :
            IconButton(
              onPressed: (){
                read.onNextStep(read.currentPageIndex-1);
              },
              icon: const Icon(Icons.chevron_left),
            ),
            actions: [
              if (read.currentPageIndex != 3)
              TextButton(
                onPressed: (){},
                child: Text('Steps ${read.currentPageIndex+1}/4'),
              ) else
              TextButton(
                onPressed: (){
                  read.initPage();
                },
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
                      title: 'Choose client natural level',
                      chooseColorTitle: 'Lighter Blonde',
                      selectedColor: watch.selectedColors[0],
                      hairColorPageType: HairColorPageType.naturalLevel,
                    ),
                    ShowColor(
                      title: 'Select client current color',
                      chooseColorTitle: 'Blonde',
                      selectedColor: watch.selectedColors[1],
                      hairColorPageType: HairColorPageType.primaryColor,
                    ),
                    ShowColor(
                      title: 'Choose client desired Tones',
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
                margin: const EdgeInsets.only(bottom: 30),
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

        ).menu(context),
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
