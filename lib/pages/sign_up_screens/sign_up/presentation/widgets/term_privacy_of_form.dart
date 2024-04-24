
part of 'widgets.dart';

class TermPrivacyOfForm extends StatelessWidget {
  const TermPrivacyOfForm({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignUpViewModel>();
    final watch = context.watch<SignUpViewModel>();
    return Row(
      children: [
        const Gap(10),
        Checkbox(
          onChanged: (_) {
            read.onTapPrivacyPolicyBox();
          },
          value: watch.isAgree,
          side: BorderSide(
            width: 2,
            color: AppColors.whiteColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'By clicking Sign up you agree to the following',
              style: TextStyle(
                fontSize: 12.h(context),
                color: AppColors.whiteColor,

              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    context.push(RouteNames.aboutTermPrivacy,
                      extra: AboutTermPrivacyType.term,
                    );
                  },
                  child: Text(
                    'Terms & Conditions',
                    style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
                  ),
                ),
                const Gap(5),
                Container(
                  height: 10,
                  width: 1,
                  color: AppColors.whiteColor,
                ),
                const Gap(5),
                InkWell(
                  onTap: (){
                    context.push(RouteNames.aboutTermPrivacy,
                      extra: AboutTermPrivacyType.privacy,
                    );
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
