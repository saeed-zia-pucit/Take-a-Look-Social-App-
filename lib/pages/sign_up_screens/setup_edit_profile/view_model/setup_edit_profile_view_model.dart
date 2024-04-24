
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SetupEditProfileViewModel extends ChangeNotifier {
  XFile? image;
  void uploadLicense() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    print(image?.name);
    notifyListeners();
  }

  bool isStudent = false;
  void onTapStudent() {
    isStudent = !isStudent;
    notifyListeners();
  }

}