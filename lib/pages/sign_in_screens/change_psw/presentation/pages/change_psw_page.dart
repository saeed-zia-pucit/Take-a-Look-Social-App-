
part of 'pages.dart';

class ChangePswPage extends StatefulWidget {
  const ChangePswPage({super.key});

  @override
  State<ChangePswPage> createState() => _ChangePswPageState();
}

class _ChangePswPageState extends State<ChangePswPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageBackground(image: AppImages.changePswBackground),
          const ChangePswForm(),
        ],
      ),
    );
  }
}
