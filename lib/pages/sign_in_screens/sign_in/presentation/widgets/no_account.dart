
part of 'widgets.dart';

class SignInNoAccount extends StatelessWidget {
  const SignInNoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 14.h(context),
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () => context.pushReplacement(RouteNames.signUp),
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 14.h(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
