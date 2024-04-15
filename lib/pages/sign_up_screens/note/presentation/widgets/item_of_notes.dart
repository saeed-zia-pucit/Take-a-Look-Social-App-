
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/pages/sign_up_screens/note/view_model/note_view_model.dart';

class ItemOfNotes extends StatelessWidget {
  const ItemOfNotes({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final read = context.read<NoteViewModel>();
    final watch = context.watch<NoteViewModel>();
    return GestureDetector(
      onTap: () {
        read.onTapPressNoteItem(index);
      },
      onLongPress: () {
        read.onLongPressNoteItem(index);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: (watch.noteChecks[index]) ?
              AppColors.primaryColor.withOpacity(.2):
              AppColors.whiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: (watch.noteChecks[index]) ?
                Colors.transparent :
                AppColors.greyColor,
                width: .2
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Color ',
                ),
                Expanded(
                  child: Text(
                    'Dark blonde is the combination of yellow and black, while light brown is the combination',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                Text(
                  '4 April | 12:00 PM',
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (watch.noteChecks[index])
          Align(
            alignment: Alignment.topRight,
            child: Checkbox(
              onChanged: (_){},
              value: true,
              splashRadius: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
