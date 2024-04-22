
part of 'widgets.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.blackWithOpacity,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Gap(10),
          TextFieldWithTitle(
            title: 'Email',
            titleColor: AppColors.whiteColor,
          ),
          const Gap(20),
          TextFieldWithTitle(
            title: 'Password',
            titleColor: AppColors.whiteColor,
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye),
            ),
          ),
          const Gap(20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.push(RouteNames.forget),
              child: const Text('Forget password?'),
            ),
          ),
          ElevatedButton(
            onPressed: () => context.pushReplacement(RouteNames.location),
            child: Text(
              'Sign In',
              style: GoogleFonts.nunito(
                fontSize: 14.h(context),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'Continue with',
            style: TextStyle(
              height: 5,
              fontSize: 12,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          context.facebookButton(context),
          context.googleButton(context),
          context.appleButton(context),
          const Gap(10),
        ],
      ),
    );
  }
}
