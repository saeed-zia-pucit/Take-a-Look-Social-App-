part of 'pages.dart';

class ChangePswPage extends StatefulWidget {
  ChangePswPage({super.key, required this.token_email});

  var token_email;

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
          PageBackgroundImage(
            image: AppImages.changePswBackground,
          ),
          ChangePswForm(token_email: widget.token_email),
        ],
      ),
    );
  }
}
