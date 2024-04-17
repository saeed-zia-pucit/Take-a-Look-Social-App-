
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/constants/app_icons.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/pages/sign_up_screens/note/presentation/widgets/item_of_notes.dart';
import 'package:take_a_look/pages/sign_up_screens/note/view_model/note_view_model.dart';

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
