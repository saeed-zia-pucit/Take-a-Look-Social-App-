
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/core/utils/toast_bar.dart';
import 'package:take_a_look/pages/sign_up_screens/sign_up/data/repo/sign_up_repo.dart';

import '../../../../core/router/router.dart';
import '../../setup_edit_profile/presentation/pages/pages.dart';

class SignUpViewModel extends ChangeNotifier {

  SignUpViewModel(this.signUpRepo);

  final SignUpRepo signUpRepo;

  bool isAgree = false;
  bool isLoading = false;
  void onTapPrivacyPolicyBox() {
    isAgree = !isAgree;
    notifyListeners();
  }

  void init() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if ((firstName.isEmpty) ||
        (lastName.isEmpty) ||
        (email.isEmpty) ||
        (password.isEmpty) ||
        (confirmPassword.isEmpty)
    ) {
      FocusManager.instance.primaryFocus!.unfocus();
      Utils.showToast('Fill in the fields');
      return;
    }

    if (!email.contains('@')) {
      Utils.showToast('Wrong email format');
      return;
    }

    if (password != confirmPassword) {
      Utils.showToast('Password and confirmation password must be the same');
      return;
    }

    bool isPasswordValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$').hasMatch(password);

    if (!isPasswordValid) {
      Utils.showToast('Password must be at least 6 characters long and contain at least one uppercase letter, one number, and a special character');
      return;
    }

    isLoading = true;
    notifyListeners();
    final response = await signUpRepo.signUp(
      UserModel(
        firstname: firstName,
        lastname: lastName,
        email: email,
        password: password,
      ),
    );

    isLoading = false;
    notifyListeners();

    if (response != null) {
      context.push(
        RouteNames.profileSetupEdit,
        extra: SetupEditProfileType.setup
      );
    }
  }

}