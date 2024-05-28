
part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Future.delayed(const Duration(seconds: 1), () async {
      // User? user = FirebaseAuth.instance.currentUser;
      await context.read<ProfileViewModel>().getUser();
      String? token = await AppLocalData.getUserToken;
      if (token == null) {
        context.pushReplacement(RouteNames.onBoard);
      } else {
        context.pushReplacement(
          RouteNames.homeFeed,
          extra: HomeFeedPageType.feed
        );
      }
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(147, 178, 253, 1),
              Color.fromRGBO(244, 147, 184, 1),
              Color.fromRGBO(173, 127, 250, 1),
            ]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Take A Look', style: GoogleFonts.dancingScript(fontSize: 36, color: AppColors.whiteColor, fontWeight: FontWeight.w700),),
              const Gap(10),
              Text('Explore hair color formulas, techniques,\neducation and tutorials',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: AppColors.whiteColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
