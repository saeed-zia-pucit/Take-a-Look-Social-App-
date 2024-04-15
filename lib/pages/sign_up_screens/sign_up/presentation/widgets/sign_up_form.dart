
part of 'widgets.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.blackWithOpacity,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          FieldsOfForm(),

          TermPrivacyOfForm(),

          ButtonsOfForm(),
          Gap(10),
        ],
      ),
    );
  }
}
