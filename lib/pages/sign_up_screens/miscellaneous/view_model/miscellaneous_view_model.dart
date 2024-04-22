
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/core/widgets/confirm_dialog.dart';

class MiscellaneousViewModel extends ChangeNotifier {

  bool showDeleteDialog = false;
  void onTapDeleteAccount(bool show) {
    showDeleteDialog = show;
    notifyListeners();
  }

  void logOut(BuildContext context) async {

    bool? isYes = await confirmDialog(context);
    if (isYes == null) return;

    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance.currentUser == null) {
      context.go(RouteNames.signIn);
    }
  }

}