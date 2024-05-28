
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/pages/sign_in_screens/forget/data/repo/forget_repo.dart';

import '../../../../core/router/router.dart';

class ForgetViewModel extends ChangeNotifier {

  ForgetViewModel(this.forgetRepo);

  final ForgetRepo forgetRepo;

  TextEditingController emailEditingController = TextEditingController();

  Future<void> sendToEmail(BuildContext context) async {
    if (emailEditingController.text.isEmpty) return;

    await forgetRepo.sendToEmail(context, emailEditingController.text.trim());

    context.push(RouteNames.verify);

  }
}