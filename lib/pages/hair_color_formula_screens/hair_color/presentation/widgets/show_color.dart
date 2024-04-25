
part of 'widgets.dart';

class ShowColor extends StatelessWidget {
  const ShowColor({super.key,
    required this.title,
    required this.chooseColorTitle,
    required this.hairColorPageType,
    required this.selectedColor,
  });

  final String title;
  final String chooseColorTitle;
  final HairColorPageType hairColorPageType;
  final ColorModel selectedColor;


  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HairColorViewModel>();
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                if (hairColorPageType.index != 0)
                TextButton(
                  onPressed: (){},
                  child: const Text('View level'),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 110.h(context)),
                color: selectedColor.color,
              ),
            ),
          ],
        ),
        if (watch.currentPageIndex < 3)
        Align(
          alignment: Alignment.bottomCenter,
          child: ChooseColor(
            colors: (hairColorPageType.isPrimaryColor) ?
            watch.primaryColors :
            (hairColorPageType.isNaturalLevel) ?
            watch.naturalLevelColors :
            watch.desiredTones,
          ),
        ),
      ],
    );
  }
}
