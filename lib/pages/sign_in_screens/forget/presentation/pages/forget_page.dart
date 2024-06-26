
part of 'pages.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageBackgroundImage(image: AppImages.forgetBackground),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.statusBarHeightGap,
                InkWell(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset(AppIcons.backIcon,),
                ),
                // const ForgetHeader(),
                const Header(
                  title: 'Forgot Password',
                  content1: 'No worries, please enter the email associated\nwith your account',
                ),
                const Gap(50),
                const ForgetForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
