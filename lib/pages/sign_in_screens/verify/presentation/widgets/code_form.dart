
part of 'widgets.dart';

class VerifyCodeForm extends StatelessWidget {
  const VerifyCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.blackWithOpacity,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              'Enter Code Here',
              style: GoogleFonts.nunito(
                fontSize: 14.h(context),
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ItemOfCode(index: 0),
                ItemOfCode(index: 1),
                ItemOfCode(index: 2),
                ItemOfCode(index: 3),
              ],
            ),
            const Gap(20),
            Text(
              '00:00',
              style: GoogleFonts.nunito(
                fontSize: 14.h(context),
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(40),
            ElevatedButton(
              onPressed: () => context.push(RouteNames.changePsw),
              child: const Text('Verify'),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t receive code?',
                  style: GoogleFonts.nunito(
                    fontSize: 11.h(context),
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.nunito(
                      fontSize: 11.h(context),
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
