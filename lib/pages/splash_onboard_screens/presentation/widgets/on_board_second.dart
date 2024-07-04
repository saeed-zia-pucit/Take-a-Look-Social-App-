
part of 'widgets.dart';

class OnBoardSecond extends StatelessWidget {
  const OnBoardSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(244, 147, 184, 1),
            Color.fromRGBO(244, 147, 184, 1),
            Color.fromRGBO(255, 255, 255, 0),
          ]
        )
      ),
      child: Stack(
        children: [
          SvgPicture.asset(AppIcons.secondOnboard_1),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(MediaQuery.of(context).padding.top,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Take A Look',
                                style: GoogleFonts.dancingScript(
                                  fontSize: 36.h(context),
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              InkWell(
                                onTap: () => context.pushReplacement(RouteNames.signIn),
                                child: Text('Skip', style: GoogleFonts.nunito(
                                  fontSize: 14.h(context),
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),),
                              )
                            ],
                          ),
                          const Gap(20),
                          Text('Move beyond the limitations of\nhair color formulas',
                            style: GoogleFonts.nunito(
                              fontSize: 24.h(context),
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(10),
                          Text('Anytime, anywhere to take a hair\nformulas',
                            style: GoogleFonts.nunito(
                              fontSize: 12.h(context),
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(AppIcons.secondOnboard_2),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: SvgPicture.asset(AppIcons.secondOnboard_3),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(AppIcons.secondOnboard_4),
                              ),
                            ),
                            Image.asset(AppIcons.secondOnboard_5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
