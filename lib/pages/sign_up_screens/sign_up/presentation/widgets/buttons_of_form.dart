
part of 'widgets.dart';

class ButtonsOfForm extends StatelessWidget {
  const ButtonsOfForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (context.read<SignUpViewModel>().isAgree) {
                context.push(
                RouteNames.profileSetupEdit,
                extra: SetupEditProfileType.setup
              );
              } else {
                context.showSnackBar(
                  'You must agree to Terms & Conditions and Privacy Policy in order to sign up'
                );
              }
            },
            child: const Text('Sign Up'),
          ),
          const Gap(30),
          Text(
            'Continue with',
            style: GoogleFonts.nunito(
              fontSize: 12,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap(30),
          context.facebookButton(context),
          context.googleButton(context),
          context.appleButton(context),
        ],
      ),
    );
  }
}
