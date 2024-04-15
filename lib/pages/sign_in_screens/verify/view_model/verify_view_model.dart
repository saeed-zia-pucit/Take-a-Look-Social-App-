
import 'package:flutter/cupertino.dart';

class VerifyViewModel extends ChangeNotifier {
  List<TextEditingController> textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  void moveFocus(BuildContext context, bool isEmpty, int index) {
    if (isEmpty) {
      if (index == 0) {
        FocusScope.of(context).requestFocus(focusNodes[index]);
      } else {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    } else {
      if (index == 3) {
        FocusScope.of(context).requestFocus(focusNodes[index]);
      } else {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    }
    // FocusScope.of(context).requestFocus(focusNodes[index]);

    notifyListeners();
  }
}