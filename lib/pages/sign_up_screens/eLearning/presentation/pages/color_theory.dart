part of 'pages.dart';

class ColorTheory extends StatefulWidget {
  const ColorTheory({
    super.key,
  });

  @override
  State<ColorTheory> createState() => _ColorTheoryState();
}

class _ColorTheoryState extends State<ColorTheory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Theory')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                // height: 120,
                decoration: BoxDecoration(
                  // color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                 /* border: Border.all(
                    color: AppColors.borderColor, // Border color
                    width: 1, // Border width
                  ),*/
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppImages.color_theory,
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
