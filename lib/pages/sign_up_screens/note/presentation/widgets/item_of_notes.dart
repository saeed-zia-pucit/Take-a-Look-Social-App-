
part of 'widgets.dart';

class ItemOfNotes extends StatelessWidget {
  const ItemOfNotes({super.key, required this.index, required this.noteModel});

  final int index;
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    final read = context.read<NoteViewModel>();
    final watch = context.watch<NoteViewModel>();
    return GestureDetector(
      onTap: () {
        read.isSelected ?
        read.onTapDuringSelectNoteItem(index) :
        read.onTapNoteItem(context, noteModel);
      },
      onLongPress: () {
        read.onLongPressNoteItem(index);
      },
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: (read.noteChecks[index]) ?
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
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      noteModel.title ?? '',
                    ),
                    Expanded(
                      child: Text(
                        noteModel.content ?? '',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    Text(
                      // '4 April | 12:00 PM',
                      noteModel.updateAt.toString().getDateTimeFormatted,
                      style: GoogleFonts.nunito(
                        fontSize: 10,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
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
