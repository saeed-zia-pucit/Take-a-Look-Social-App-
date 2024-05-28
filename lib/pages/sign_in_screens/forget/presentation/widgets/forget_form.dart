
part of 'widgets.dart';

class ForgetForm extends StatelessWidget {
  const ForgetForm({super.key});

  @override
  Widget build(BuildContext context) {

    final read = context.read<ForgetViewModel>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.blackWithOpacity,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Gap(10),
          TextFieldWithTitle(
            controller: read.emailEditingController,
            title: 'Email',
            titleColor: AppColors.whiteColor,
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.h(context)),
              child: SvgPicture.asset(AppIcons.checkCircleIcon),
              // child: Icon(Icons.add)
            ),
          ),
          Gap(100.h(context)),
          ElevatedButton(
            onPressed: () {
              read.sendToEmail(context);
            },
            child: const Text('Verify'),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
