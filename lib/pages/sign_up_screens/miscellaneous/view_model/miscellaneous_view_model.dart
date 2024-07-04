
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/core/widgets/confirm_dialog.dart';
import 'package:take_a_look/pages/sign_up_screens/miscellaneous/data/repo/miscellaneous_repo.dart';

import '../../../../core/data/repo/social_auth.dart';
import '../../../../core/utils/toast_bar.dart';
import '../../../../di_service.dart';

class MiscellaneousViewModel extends ChangeNotifier {

  MiscellaneousViewModel(this.miscellaneousRepo);
  final MiscellaneousRepo miscellaneousRepo;

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
    bool? isDelete = await getIt.get<SocialAuth>().logOut();
    await AppLocalData.removeAll();
    if (isDelete == null) return;
    if (context.mounted) context.go(RouteNames.signIn);

  }

  bool isLoading = false;
  void deleteAccount(BuildContext context) async {
    // bool? isDelete = await getIt.get<SocialAuth>().deleteAccount();
    showDeleteDialog = false;
    isLoading = true;
    bool isDelete = await miscellaneousRepo.deleteAccount();
    isLoading = false;
    if (isDelete == false) {
      Utils.showToast('The account was not deleted.');
      return;
    }
    if (context.mounted) context.go(RouteNames.signIn);
  }

}