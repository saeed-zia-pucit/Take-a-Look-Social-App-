part of 'widgets.dart';

class HairView extends StatefulWidget {
  const HairView({Key? key, required this.hairColor}) : super(key: key);

  final List<ColorModel> hairColor;

  @override
  _HairViewState createState() => _HairViewState();
}

// Step 1: Assign a GlobalKey to the RepaintBoundary
final GlobalKey globalKey = GlobalKey();

class _HairViewState extends State<HairView> {

  String _selectedCategory = 'Other';
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddPortfolioViewModel>(context, listen: false);

    model.selectedCategory=_selectedCategory;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Guide to blonde hair colors Notes',
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: context.width - 50,
            child: RepaintBoundary(
              key: globalKey,
              child: Stack(
                fit: StackFit.expand,
                children: widget.hairColor.map((colorModel) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      colorModel.color.withOpacity(0.5),
                      BlendMode.modulate,
                    ),
                    child: Image.asset(
                      AppImages.hair01,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HairItem(),
            HairItem(),
            HairItem(),
            HairItem(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Additional Notes',
              ),
              Text(
                'Dark blonde is the combination of yellow and black, while light brown is the combination of brown and white. The base color of dark blonde is gold, while that of light brown is brown. Both colors are just separated by one shade.',
                style: TextStyle(fontSize: 12, color: AppColors.greyColor),
              ),
              const Gap(20),
              TextField(
                controller: model.contentController,
                maxLines: 3,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Add Portfolio...',
                  // labelText: 'Add Portfolio...',
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Post Category:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                        model.selectedCategory=_selectedCategory;
                      });
                    },
                    items: <String>[
                      "Other",
                      "Brunette",
                      "Blonde",
                      "Red",
                      "Black"
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Disable the button
                    (context as Element).markNeedsBuild();
                    await Future.delayed(Duration(seconds: 3));
                    // Enable the button
                    (context as Element).markNeedsBuild();
                    // Usage
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Saving image!, Please wait!'),
                      ),
                    );
                    Uint8List imageData = await capturePng();
                    String imagePath =
                        await saveImage(imageData, 'filtered_image');
                    model.setImage(imagePath);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Saving post, Please wait!'),
                      ),
                    );
                    final result = await model.postDraft();
                    if (result?.statusCode == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Post successful submitted'),
                        ),
                      );
                      //move to the next page
                      context.pushReplacement(
                        RouteNames.homeFeed,
                        extra: HomeFeedPageType.feed,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Post submission failed'),
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<Uint8List> capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      print(e);
      return Uint8List(0);
    }
  }

// Step 4: Method to save the image to the device storage
  Future<String> saveImage(Uint8List imageData, String imageName) async {
    final directory = await getApplicationDocumentsDirectory();
    final File imageFile = File('${directory.path}/$imageName.png');
    await imageFile.writeAsBytes(imageData);
    return imageFile.path;
  }
}
