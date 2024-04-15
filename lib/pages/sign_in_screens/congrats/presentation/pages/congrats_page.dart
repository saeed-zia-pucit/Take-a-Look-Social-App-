
part of 'pages.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({super.key});

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageBackground(image: AppImages.congratsBackground),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.blackWithOpacity,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(20),
                    SvgPicture.asset(
                      AppSVG.congratsIcon,
                      height: 165.h(context),
                    ),
                    const Gap(30),
                    const Header(
                      title: 'Congrats',
                      content1: 'You have successfully change password.\nPlease use the new password when logging in.',
                    ),
                    const Gap(50),
                    ElevatedButton(
                      onPressed: () => context.pushReplacement(RouteNames.signIn),
                      child: const Text('Sign In'),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
