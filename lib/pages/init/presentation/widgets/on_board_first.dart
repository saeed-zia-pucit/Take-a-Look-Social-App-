
part of 'widgets.dart';

class OnBoardFirst extends StatelessWidget {
  const OnBoardFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(MediaQuery.of(context).padding.top,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Take A Look', style: GoogleFonts.dancingScript(fontSize: 36.h(context), color: AppColors.primaryColor, fontWeight: FontWeight.w700),),
                            InkWell(
                              onTap: () => context.pushReplacement(RouteNames.signIn),
                              child: Text('Skip', style: GoogleFonts.nunito(fontSize: 14.h(context), color: AppColors.secondaryColor, fontWeight: FontWeight.w600),),
                            )
                          ],
                        ),
                        const Gap(20),
                        Text('Nurish your inner skils in cosmetology',
                          style: GoogleFonts.nunito(
                            fontSize: 24.h(context),
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(10),
                        Text('Subscribe premium content to access e-leaning content\nand start learning',
                          style: GoogleFonts.nunito(
                            fontSize: 12.h(context),
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(AppSVG.firstOnboard_1),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(AppSVG.firstOnboard_2, height: .4.hp(context),),
        ],
      ),
    );
  }
}
