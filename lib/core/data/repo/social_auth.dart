
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialAuth {
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
  Future<User?> signInWithApple();
  Future<bool?> deleteAccount();
  Future<bool?> logOut(BuildContext context);
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
  Future<User?> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider().addScope('email').addScope('name');
      appleProvider.addScope('email');
      appleProvider.addScope('name');
      UserCredential userCredential = await FirebaseAuth.instance.signInWithProvider(appleProvider);
      User? user = userCredential.user;
      return user;
    } catch (e) {
      return null;
    }

  }

  @override
  Future<bool?> logOut(BuildContext context) async {
    try {
      /// Google
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      /// Facebook
      await FacebookAuth.instance.logOut();

      /// Apple doesn't need

      /// Sign out
      await FirebaseAuth.instance.signOut();
      if (FirebaseAuth.instance.currentUser == null) {
        return true;
      } else {
        return null;
      }
    } catch(e) {
      return null;
    }
  }

  @override
  Future<bool?> deleteAccount() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final providerData = firebaseAuth.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        /// Apple
        await firebaseAuth.currentUser!.reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        /// Google
        await firebaseAuth.currentUser!.reauthenticateWithProvider(GoogleAuthProvider());
      } else if (FacebookAuthProvider().providerId == providerData.providerId) {
        /// Facebook
        await firebaseAuth.currentUser!.reauthenticateWithProvider(FacebookAuthProvider());
      }
      await firebaseAuth.currentUser?.delete();
      return true;
    } catch (e) {
      return null;
    }
  }

}
