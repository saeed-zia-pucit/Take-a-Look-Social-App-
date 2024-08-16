part of 'pages.dart';

class FollowLinks extends StatefulWidget {
  const FollowLinks({
    super.key,
  });

  @override
  State<FollowLinks> createState() => _FollowLinksState();
}

class _FollowLinksState extends State<FollowLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Follow links')),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewScreen(
                                    url:
                                        "https://www.salonwholesaler.com/pages/free-education",
                                    title: "E-Learning Online Classes")),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              'Online classes',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 30 / 24,
                                color: Color(0xFF212121),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 24.54,
                                height: 24.65,
                                child: Image.asset(
                                  AppIcons.linkIcon,
                                  height: 20.h(context),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewScreen(
                                    url:
                                        "https://www.salonwholesaler.com/pages/free-education",
                                    title: "E-Learning website")),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              'E learning website',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                // Ensure the Nunito font is added in your pubspec.yaml
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 30 / 24,
                                // Line height / font size for proper scaling
                                color: Color(0xFF212121),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 24.54,
                                height: 24.65,
                                child: Image.asset(
                                  AppIcons.linkIcon,
                                  height: 20.h(context),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewScreen(
                                    url:
                                        "https://www.1stchoice-ce.com/courses/checkout/texas/texas-cosmetology-license-renewal-online",
                                    title: "Renew cosmetology license")),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              'Renew cosmetology license',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                // Ensure the Nunito font is added in your pubspec.yaml
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 30 / 24,
                                // Line height / font size for proper scaling
                                color: Color(0xFF212121),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 24.54,
                                height: 24.65,
                                child: Image.asset(
                                  AppIcons.linkIcon,
                                  height: 20.h(context),
                                ),
                              ),
                            )
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
