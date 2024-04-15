
part of 'pages.dart';

class EnableLocationPage extends StatefulWidget {
  const EnableLocationPage({super.key});

  @override
  State<EnableLocationPage> createState() => _EnableLocationPageState();
}

class _EnableLocationPageState extends State<EnableLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                AppSVG.locationIcon,
                height: 230.h(context),
              ),
              Header(
                title: 'Enable location services',
                content1: 'Allow app to access your location to find nearby\ncosmetologist/hair stylist',
                titleColor: AppColors.blackColor,
                content1Color: AppColors.blackColor,
              ),
              ElevatedButton(
                onPressed: (){
                  Permission.location.request();
                },
                child: const Text('Enable'),
              ),
              const Gap(0)
            ],
          ),
        ),
      ),
    );
  }
}
