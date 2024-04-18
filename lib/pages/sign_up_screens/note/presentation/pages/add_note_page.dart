
part of 'pages.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Note'
        ),
        actions: [
          IconButton(
            onPressed: (){},
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
              style: TextStyle(
                fontSize: 12,
                color: AppColors.greyColor,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            const Text('Add Notes',),
            TextField(
              style: TextStyle(
                fontSize: 12,
                color: AppColors.greyColor,
              ),
              minLines: 10,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
