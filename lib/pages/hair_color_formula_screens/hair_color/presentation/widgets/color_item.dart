part of 'widgets.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.index,
    required this.colorModel,
    this.image,
  });

  final int index;
  final ColorModel colorModel;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final read = context.read<HairColorViewModel>();
    bool selected = read.colorItemsSelect[read.currentPageIndex][index];
    return GestureDetector(
      onTap: () {
        read.onTapColorItem(index, read.currentPageIndex, colorModel);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80.h(context),
            width: 50.h(context),
            margin:
                const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                image:
                    (read.currentPageIndex == 0 || read.currentPageIndex == 1)
                        ? DecorationImage(
                            image: AssetImage(read.currentPageIndex == 1
                                ? AppImages.desire_hairs[index]
                                : AppImages.hairs[index]),
                            fit: BoxFit.cover,
                          )
                        : null,
                color: colorModel.color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text('${index + 1}'),
          const Gap(5),
          (selected)
              ? SizedBox(
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
                )
              : const SizedBox(
                  height: 5,
                ),
        ],
      ),
    );
  }
}
