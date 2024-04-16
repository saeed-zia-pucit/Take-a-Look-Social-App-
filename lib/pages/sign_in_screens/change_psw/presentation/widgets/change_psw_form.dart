
part of 'widgets.dart';

class ChangePswForm extends StatelessWidget {
  const ChangePswForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.statusBarHeightGap,
          IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(AppSVG.backIcon,),
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
                  content1: 'To keep your account secure, consider changing\nyour password often',
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
                TextFieldWithTitle(
                  title: 'Old password',
                  obscureText: true,
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const Gap(20),
                TextFieldWithTitle(
                  title: 'New password',
                  obscureText: true,
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const Gap(20),
                TextFieldWithTitle(
                  title: 'Confirm password',
                  obscureText: true,
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const Gap(50),
                ElevatedButton(
                  onPressed: () => context.go(RouteNames.congrats),
                  child: const Text(
                    'Change password',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
