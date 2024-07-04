import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../di_service.dart';
import '../../pages/hair_color_formula_screens/home_feed/data/repo/feed_repo.dart';

class SlidableDeleteButton extends StatelessWidget {
  SlidableDeleteButton({super.key, required this.id,required this.onDeleteSuccess,});

  final feedRepo = getIt<FeedRepoImpl>();
  final String id;
  final VoidCallback onDeleteSuccess;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isDeleted = await feedRepo.deleteComment(id);
        if (isDeleted) {
          print('Comment deleted successfully');
          onDeleteSuccess();
          // You can add code here to update the UI after successful deletion
        } else {
          print('Failed to delete comment');
        }
        Slidable.of(context)!.close();
      },
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SvgPicture.asset(
          AppIcons.trashBasketIcon,
          colorFilter: ColorFilter.mode(
            AppColors.whiteColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
