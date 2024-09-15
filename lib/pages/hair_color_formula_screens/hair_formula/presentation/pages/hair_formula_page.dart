
part of 'pages.dart';

class HairFormula extends StatefulWidget {
  const HairFormula({super.key, required this.colors});

  final List<ColorModel> colors;

  @override
  State<HairFormula> createState() => _HairFormulaState();
}

class _HairFormulaState extends State<HairFormula> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hair Formula'),
        leading: IconButton(
          onPressed: (){
            context.pushReplacement(
              RouteNames.homeFeed,
              extra: HomeFeedPageType.feed,
            );
          },
          icon: const Icon(Icons.chevron_left),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(CupertinoIcons.heart),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedColors(colors: widget.colors),
            HairView( hairColor: widget.colors),

            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //
            //       const Text('URL'),
            //       const Gap(20),
            //       DottedBorder(
            //         borderType: BorderType.RRect,
            //         radius: const Radius.circular(12),
            //         dashPattern: const [5],
            //         child: Padding(
            //           padding: const EdgeInsets.all(5),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               const Text(
            //                 'https//play.google.com/store/apps/details?..'
            //               ),
            //               TextButton(
            //                 onPressed: (){},
            //                 child: const Text('Copy'),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       const Gap(30),
            //       const Text('Video'),
            //       const Gap(20),
            //       Container(
            //         height: 200,
            //         width: double.infinity,
            //         padding: const EdgeInsets.all(10),
            //         alignment: Alignment.bottomRight,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           image: DecorationImage(
            //             image: AssetImage(AppImages.forgetBackground),
            //             fit: BoxFit.cover
            //           )
            //         ),
            //         child: SvgPicture.asset(AppIcons.playIcon),
            //       ),
            //       const Gap(10),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
