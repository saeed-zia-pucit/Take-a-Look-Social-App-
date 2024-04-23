
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/core/widgets/confirm_dialog.dart';

import '../../../../core/data/repo/social_auth.dart';
import '../../../../di_service.dart';

class MiscellaneousViewModel extends ChangeNotifier {

  bool showDeleteDialog = false;
  void onTapDeleteAccount(bool show) async {
    showDeleteDialog = show;
    notifyListeners();
  }

  void logOut(BuildContext context) async {
    bool? isYes = await confirmDialog(
      context,
      title: 'Log out',
      content: 'Do you want to log out?',
    );
    if (isYes == null) return;
    bool? isDelete = await getIt.get<SocialAuth>().logOut(context);

    if (isDelete == null) return;
    if (context.mounted) context.go(RouteNames.signIn);

  }

  void deleteAccount(BuildContext context) async {
    bool? isDelete = await getIt.get<SocialAuth>().deleteAccount();
    if (isDelete == null) return;
    if (context.mounted) context.go(RouteNames.signIn);
  }

}