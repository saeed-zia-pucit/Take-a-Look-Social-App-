
part of 'pages.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageBackground(image: AppImages.verifyBackground),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.statusBarHeight,
                InkWell(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset(AppSVG.backIcon,),
                ),
                const Header(
                  title: 'Verfiy Email',
                  content1: 'We sent a verification code to ',
                  content2: 'lavishproductline@gmail.com',
                ),
                const Gap(50),
                const VerifyCodeForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}
