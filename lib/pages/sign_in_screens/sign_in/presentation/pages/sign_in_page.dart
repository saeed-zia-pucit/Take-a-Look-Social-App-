
part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageBackgroundImage(image: AppImages.signInBackground),
          const Stack(
            children: [
              Column(
                children: [
                  Header(
                    title: 'Sign In',
                    content1: 'Welcome back! Enter your email and password\nbelow to sign in',
                    topPadding: true,
                  ),
                  Spacer(),
                  SignInNoAccount(),
                  Gap(20),
                ],
              ),
            ],
          ),
          const Center(
            child: SingleChildScrollView(
              child: SignInForm(),
            ),
          ),
        ],
      ),
    );
  }
}
