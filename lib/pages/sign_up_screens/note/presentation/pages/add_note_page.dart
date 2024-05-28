
part of 'pages.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key, required this.addNotePageType});

  final AddNotePageType addNotePageType;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {

    final read = context.read<NoteViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Note'
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.addNotePageType.isAdd) {
                read.addNote().then((_) {
                  Navigator.pop(context);
                },);
              } else {
                read.editNote().then((value) {
                  Navigator.pop(context);
                });
              }
            },
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title',),
            TextField(
              controller: read.titleController,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.blackColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            const Gap(20),
            const Text('Add Notes',),
            TextField(
              controller: read.contentController,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.blackColor,
              ),
              minLines: 10,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
          ],
        ),
      ),
    ).loadingView(context.watch<NoteViewModel>().isLoading);
  }
}

enum AddNotePageType {
  add,
  edit,
}

extension NotePageTypeExtension on AddNotePageType {
  bool get isAdd => AddNotePageType.add == this;
  bool get isEdit => AddNotePageType.edit == this;
}

