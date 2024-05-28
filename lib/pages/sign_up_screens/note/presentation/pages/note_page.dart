
part of 'pages.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key,});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  @override
  void initState() {
    context.read<NoteViewModel>().getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<NoteViewModel>();
    final watch = context.watch<NoteViewModel>();

    return Consumer<NoteViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            actions: [
              if (watch.isSelected)
              Checkbox(
                onChanged: (value) {
                  read.onTapCheckBox(watch.mainCheckBoxValue);
                },
                value: watch.mainCheckBoxValue,
                tristate: true,
              ),
            ],
          ),

          body: GridView.builder(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 80,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: viewModel.notes.length,
            itemBuilder: (context, index) {
              return ItemOfNotes(index: index, noteModel: viewModel.notes[index]!,);
            },
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              (!watch.isSelected) ?
              read.openAddNotePage(context) :
              read.deleteNotes(context);
            },
            child: (watch.isSelected) ?
            SvgPicture.asset(AppIcons.trashBasketIcon) :
            const Icon(CupertinoIcons.add),
          ),
        ).loadingView(read.isLoading && read.isShowLoading);
      }
    );
  }
}
