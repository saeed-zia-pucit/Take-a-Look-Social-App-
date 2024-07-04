
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/core/utils/toast_bar.dart';
import 'package:take_a_look/pages/sign_in_screens/sign_in/data/repo/sign_in_repo.dart';

import '../../../../core/data/models/user_model.dart';
import '../../../../core/router/router.dart';
import '../../../hair_color_formula_screens/home_feed/presentation/pages/pages.dart';

class SignInViewModel extends ChangeNotifier {

  SignInViewModel(this.signInRepo);

  final SignInRepo signInRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void init() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> signIn(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // email = 'shahobtursunov22@gmail.com';
    // password = 'Qwerty123!';

    if (!email.contains('@')) {
      Utils.showToast('Wrong email format');
      return;
    }

    if ((email.isEmpty) || (password.isEmpty)) {
      FocusManager.instance.primaryFocus!.unfocus();
      Utils.showToast('Fill in the fields');
      return;
    }

    isLoading = true;
    notifyListeners();
    final response = await signInRepo.signIn(
      context,
      UserModel(
        email: email,
        password: password,
      ),
    );

    isLoading = false;
    notifyListeners();

    if (response == null) {
      Utils.showToast('Something went wrong');
    } else {
      if (await Permission.location.isDenied) {
        context.pushReplacement(RouteNames.location);
      } else {
        context.pushReplacement(
          RouteNames.homeFeed,
          extra: HomeFeedPageType.feed,
        );
      }
    }
  }

}