
import 'package:flutter/cupertino.dart';

class NoteViewModel extends ChangeNotifier {
  List<bool> noteChecks = [false, false, false, false, false, false];
  bool isSelected = false;

  void onLongPressNoteItem(int index) {
    isSelected = true;
    noteChecks[index] = !noteChecks[index];
    notifyListeners();
  }

  void onTapPressNoteItem(int index) {
    if (isSelected) {
      noteChecks[index] = !noteChecks[index];
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
      noteChecks = List.generate(6, (index) => true);
    } else {
      noteChecks = List.generate(6, (index) => false);
      isSelected = false;
    }
    notifyListeners();
  }
}