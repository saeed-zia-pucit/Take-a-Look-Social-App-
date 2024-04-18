
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
            onPressed: () => context.pushReplacement(
              RouteNames.homeFeed,
              extra: HomeFeedPageType.feed,
            ),
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
          context.facebookButton,
          context.googleButton,
          context.appleButton,
        ],
      ),
    );
  }
}
