part of 'pages.dart';

class VerifyPage extends StatefulWidget {
  VerifyPage({super.key, required this.email});

  var email;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    if (widget.email.length > 0) email = widget.email['email'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageBackgroundImage(image: AppImages.verifyBackground),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.statusBarHeightGap,
                InkWell(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset(
                    AppIcons.backIcon,
                  ),
                ),
                Header(
                  title: 'Verify Email',
                  content1: 'We sent a verification code to ',
                  content2: '$email',
                ),
                const Gap(50),
                VerifyCodeForm(email: email),
              ],
            ),
          )
        ],
      ),
    );
  }
}
