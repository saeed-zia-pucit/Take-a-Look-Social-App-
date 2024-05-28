
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/widgets/confirm_dialog.dart';
import 'package:take_a_look/pages/sign_up_screens/note/data/models/note_model.dart';
import 'package:take_a_look/pages/sign_up_screens/note/data/repo/note_repo.dart';
import 'package:take_a_look/pages/sign_up_screens/note/presentation/pages/pages.dart';

import '../../../../core/router/router.dart';

class NoteViewModel extends ChangeNotifier {

  NoteViewModel(this.noteRepo);
  final NoteRepo noteRepo;

  List<bool> noteChecks = [];
  bool isSelected = false;

  void onTapNoteItem(BuildContext context, NoteModel noteModel) {
    titleController.text = noteModel.title ?? '';
    contentController.text = noteModel.content ?? '';
    currentNoteModel = noteModel;
    notifyListeners();
    context.push(
      RouteNames.addNote,
      extra: AddNotePageType.edit,
    );
  }

  void onLongPressNoteItem(int index) {
    isSelected = true;
    noteChecks[index] = !noteChecks[index];
    if (noteChecks[index]) {
      notesForDelete.add(notes[index]!);
    } else {
      notesForDelete.remove(notes[index]);
    }
    notifyListeners();
  }

  void onTapDuringSelectNoteItem(int index) {
    if (isSelected) {
      noteChecks[index] = !noteChecks[index];
      if (noteChecks[index]) {
        notesForDelete.add(notes[index]!);
      } else {
        notesForDelete.remove(notes[index]);
      }
      print(notesForDelete);
      isSelected = noteChecks.contains(true);
      notifyListeners();
    }
  }

  bool? get mainCheckBoxValue {
    return (noteChecks.contains(true) && noteChecks.contains(false)) ?
    null : noteChecks.contains(true) ?
    true : false;
  }

  void onTapCheckBox(bool? value) {
    if (value == null) {
      noteChecks = List.generate(notes.length, (index) => true);
    } else {
      noteChecks = List.generate(notes.length, (index) => false);
      isSelected = false;
    }
    notifyListeners();
  }

  void openAddNotePage(BuildContext context) {
    titleController.clear();
    contentController.clear();
    notifyListeners();
    context.push(
      RouteNames.addNote,
      extra: AddNotePageType.add,
    );
  }


  /// API
  List<NoteModel?> notes = [];
  bool isLoading = false;
  bool isShowLoading = true;
  Future<void> getNotes() async {
    isLoading = true;
    isSelected = false;
    notesForDelete = [];
    notes = await noteRepo.getNotes();
    noteChecks = List.generate(notes.length, (index) => false);
    isLoading = false;
    isShowLoading = false;
    notifyListeners();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  Future<void> addNote() async {
    isLoading = true;
    notifyListeners();
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    if (title.isEmpty || content.isEmpty) {
      return;
    }

    NoteModel? newNoteModel = await noteRepo.addNote(NoteModel(title: title, content: content));
    if (newNoteModel != null) {
      notes.add(newNoteModel);
      noteChecks = List.generate(notes.length, (index) => false);
      isLoading = false;
      notifyListeners();
    }
  }

  NoteModel currentNoteModel =  NoteModel();
  Future<void> editNote() async {
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim();
    String content = contentController.text.trim();
    //
    currentNoteModel.title = title;
    currentNoteModel.content = content;
    await noteRepo.editNotes(currentNoteModel);
    await getNotes();

    isLoading = false;
    notifyListeners();
  }

  List<NoteModel> notesForDelete = [];
  Future<void> deleteNotes(BuildContext context) async {

    bool? isYes = await confirmDialog(context, title: 'Delete notes', content: 'Do you want to delete note(s)?');
    if (isYes == null) return;

    isLoading = true;
    isShowLoading = true;
    notifyListeners();

    await noteRepo.deleteNotes(notesForDelete);
    await getNotes();

    isLoading = false;
    isShowLoading = false;
    notifyListeners();
  }

}