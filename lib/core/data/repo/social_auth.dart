

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialAuth {
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
  Future<void> signInWithApple();
}

class SocialAuthImpl extends SocialAuth {

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      User? user = userCredential.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider().addScope('email').addScope('name');
      appleProvider.addScope('email');
      appleProvider.addScope('name');
      UserCredential userCredential = await FirebaseAuth.instance.signInWithProvider(appleProvider);
      User? user = userCredential.user;
      print(user?.uid);
      // return user;
    } catch (e) {
      return null;
    }

  }

}
