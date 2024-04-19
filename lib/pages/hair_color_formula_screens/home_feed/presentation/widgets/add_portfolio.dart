
part of 'widgets.dart';

class AddPortfolio extends StatelessWidget {
  const AddPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppImages.avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(10),
              Text(
                'Add Portfolio...',
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SvgPicture.asset(AppIcons.cameraIcon)
        ],
      ),
    );
  }
}
