
part of 'widgets.dart';

class HairItem extends StatelessWidget {
  const HairItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image(
        image: AssetImage(AppImages.hair1),
      ),
    );
  }
}
