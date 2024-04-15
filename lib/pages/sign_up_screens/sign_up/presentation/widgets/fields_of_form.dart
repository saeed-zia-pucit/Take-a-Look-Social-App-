
part of 'widgets.dart';

class FieldsOfForm extends StatelessWidget {
  const FieldsOfForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Gap(20),
          const TextFieldWithTitle(
            title: 'First Name',
          ),
          const Gap(20),
          const TextFieldWithTitle(
            title: 'Last Name',
          ),
          const Gap(20),
          TextFieldWithTitle(
            title: 'Email',
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.h(context)),
              child: SvgPicture.asset(AppSVG.checkCircleIcon),
            ),
          ),
          const Gap(20),
          TextFieldWithTitle(
            title: 'Password',
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.remove_red_eye),
            ),
          ),
          const Gap(20),
          TextFieldWithTitle(
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
