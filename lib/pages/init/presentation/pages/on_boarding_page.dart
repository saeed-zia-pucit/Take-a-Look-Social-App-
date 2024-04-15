
part of 'pages.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          OnBoardFirst(),
          OnBoardSecond(),
          OnBoardThird(),
        ],
      ),
    );
  }
}
