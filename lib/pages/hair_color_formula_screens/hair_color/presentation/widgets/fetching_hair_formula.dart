
part of 'widgets.dart';

class FetchingHairFormula extends StatefulWidget {
  const FetchingHairFormula({super.key});

  @override
  State<FetchingHairFormula> createState() => _FetchingHairFormulaState();
}

class _FetchingHairFormulaState extends State<FetchingHairFormula> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: (){
              context.read<HairColorViewModel>().onSubmit(context, false);
            },
            child: const Text('Cancel')
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.brushIcon),
            const Gap(20),
            const Text(
              'Fetching hair formula...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
