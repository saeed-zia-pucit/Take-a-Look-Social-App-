
part of 'widgets.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // context.statusBarHeight,
        Text(
          'Sign In\n',
          style: GoogleFonts.nunito(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Welcome back! Enter your email and password\nbelow to sign in',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: 14.h(context),
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
