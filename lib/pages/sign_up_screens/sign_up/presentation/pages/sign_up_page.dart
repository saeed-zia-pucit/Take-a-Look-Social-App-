
part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageBackground(image: AppImages.signUpBackground),
          const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Header(
                  title: 'Sign Up',
                  content1: 'Register as cosmetologist by entering your\nemail address',
                  topPadding: true,
                ),
                Gap(30),
                SignUpForm(),
                Gap(30),
                HaveAccount(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
