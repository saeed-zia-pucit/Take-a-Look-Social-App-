
part of 'widgets.dart';

class FieldsOfForm extends StatelessWidget {
  const FieldsOfForm({super.key});

  @override
  Widget build(BuildContext context) {

    final read = context.read<SignUpViewModel>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Gap(20),
          TextFieldWithTitle(
            controller: read.firstNameController,
            title: 'First Name',
          ),
          const Gap(20),
          TextFieldWithTitle(
            controller: read.lastNameController,
            title: 'Last Name',
          ),
          const Gap(20),
          TextFieldWithTitle(
            controller: read.emailController,
            title: 'Email',
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.h(context)),
              child: SvgPicture.asset(AppIcons.checkCircleIcon),
            ),
          ),
          const Gap(20),
          TextFieldWithTitle(
            controller: read.passwordController,
            title: 'Password',
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.remove_red_eye),
            ),
          ),
          const Gap(20),
          TextFieldWithTitle(
            controller: read.confirmPasswordController,
            title: 'Confirm Password',
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.remove_red_eye),
            ),
          ),
        ],
      ),
    );
  }
}
