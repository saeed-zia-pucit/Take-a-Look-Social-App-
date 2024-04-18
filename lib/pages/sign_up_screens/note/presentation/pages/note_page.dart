
part of 'pages.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    final read = context.read<NoteViewModel>();
    final watch = context.watch<NoteViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.sort),
        ),
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
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ItemOfNotes(index: index, );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          (!watch.isSelected) ?
          context.push(RouteNames.addNote): {};
        },
        child: (watch.isSelected) ?
        SvgPicture.asset(AppIcons.trashBasketIcon) :
        const Icon(CupertinoIcons.add),
      ),
    );
  }
}
