part of 'widgets.dart';

class ChangePswForm extends StatelessWidget {
  ChangePswForm({super.key, required this.token_email});

  var token_email;
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var token_email = this.token_email;

    final read = context.read<ForgetViewModel>();
    var email = token_email['email'];
    var token = token_email['token'];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.statusBarHeightGap,
          IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(
              AppIcons.backIcon,
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
          ),
          Visibility(
            visible: context.isKeyboardOpen,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  title: 'Change Password',
                  content1:
                      'To keep your account secure, consider changing\nyour password often',
                ),
              ],
            ),
          ),
          const Gap(50),
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.blackWithOpacity,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  /* TextFieldWithTitle(
              title: 'Old password',
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye),
              ),
            ),
            const Gap(20),*/
                  TextFieldWithTitle(
                    title: 'New password',
                    controller: newPasswordController,
                    obscureText: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const Gap(20),
                  TextFieldWithTitle(
                    title: 'Confirm password',
                    controller: confirmPasswordController,
                    obscureText: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const Gap(50),
                  ElevatedButton(
                    onPressed: () async {
                      if (confirmPasswordController.text !=
                          newPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'New password and confirm password should be the same'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        var response = await read.resetPassword(
                            newPasswordController.text, email, token);
                        if (response) {
                          context.go(RouteNames.congrats);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Something went wrong, please try again'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Change password',
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
