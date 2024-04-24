
part of 'widgets.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key,
    // required this.pageIndex,
    required this.index,
    this.label,
    required this.color,
    this.image,
  });

  // final int pageIndex;
  final int index;
  final Color color;
  final String? label;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final read = context.read<HairColorViewModel>();
    bool selected = read.colorItemsSelect[read.currentPageIndex][index];
    return GestureDetector(
      onTap: () {
        // print(index);
        read.onTapColorItem(index, read.currentPageIndex, color);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: (image == null) ? null :
                DecorationImage(
                  image: AssetImage(image ?? ''),
                ),
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          const Gap(5),
          (selected) ?
          SizedBox(
            height: 5,
            width: 50.h(context),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xffF493B8),
                    Color(0xffAD7FFA),
                    Color(0xff93B2FD),
                  ],
                ),
              ),
            ),
          ) :
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
