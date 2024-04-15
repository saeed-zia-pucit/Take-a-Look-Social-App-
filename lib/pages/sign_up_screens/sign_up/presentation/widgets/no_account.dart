
part of 'widgets.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
            fontSize: 14.h(context),
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () => context.pushReplacement(RouteNames.signIn),
          child: Text(
            'Sign In',
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
