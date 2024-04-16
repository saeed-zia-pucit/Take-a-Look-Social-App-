
part of 'widgets.dart';

class OnBoardThird extends StatelessWidget {
  const OnBoardThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: .5.hp(context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(147, 178, 253, 1),
                Color.fromRGBO(244, 147, 184, 1),
                Color.fromRGBO(173, 127, 250, 1),
              ]
            )
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(AppSVG.thirdOnBoard_1,),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(MediaQuery.of(context).padding.top,),
                    const Gap(20),
                    Text('Everyday bussiness makeup by\ndiscovering feeds',
                      style: GoogleFonts.nunito(
                        fontSize: 24.h(context),
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(10),
                    Text('Post your porfolio and get business impression with the help\nof your followers and followings ',
                      style: GoogleFonts.nunito(
                        fontSize: 12.h(context),
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(AppSVG.thirdOnBoard_2, height: 35.h(context)),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                height: 50.h(context),
                                AppSVG.thirdOnBoard_3,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(AppSVG.thirdOnBoard_4, height: 38.h(context),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset(AppSVG.thirdOnBoard_5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
            onPressed: () => context.pushReplacement(RouteNames.signIn),
            child: const Text('Get started'),
          ),
        ),
        Gap(MediaQuery.of(context).padding.bottom,),
      ],
    );
  }
}
