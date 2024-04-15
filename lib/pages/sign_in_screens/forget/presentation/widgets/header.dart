
part of 'widgets.dart';

class ForgetHeader extends StatelessWidget {
  const ForgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Forgot Password\n',
            style: GoogleFonts.nunito(
              fontSize: 20,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'No worries, please enter the email associated\nwith your account',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 14.h(context),
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}