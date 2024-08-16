part of 'pages.dart';

class ELearning extends StatefulWidget {
  const ELearning({
    super.key,
  });

  @override
  State<ELearning> createState() => _ELearningState();
}

class _ELearningState extends State<ELearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  // color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.pinkBorderColor, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(
                            RouteNames.colorTheory,
                          );
                        },
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              'Color Theory',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                // Ensure the Nunito font is added in your pubspec.yaml
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                height: 30 / 24,
                                // Line height / font size for proper scaling
                                color: Color(0xFF212121),
                              ),
                            ),
                            Spacer(),
                            Spacer(),
                            Container(
                              width: 34.54,
                              height: 29.65,
                              child: Icon(Icons.color_lens_outlined),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                     /* Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: AppColors.pinkBorderColor,
                        ),
                      ),
                      SizedBox(height: 20),*/
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  // color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.pinkBorderColor, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(
                            RouteNames.followLinks,
                          );
                        },
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              'E-learning',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                // Ensure the Nunito font is added in your pubspec.yaml
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                height: 30 / 24,
                                // Line height / font size for proper scaling
                                color: Color(0xFF212121),
                              ),
                            ),
                            Spacer(),
                            Spacer(),
                            Container(
                              width: 34.54,
                              height: 29.65,
                              child: SvgPicture.asset(
                                AppIcons.eduIcon,
                                height: 20.h(context),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                   /*   Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: AppColors.pinkBorderColor,
                        ),
                      ),
                      SizedBox(height: 20),*/
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
