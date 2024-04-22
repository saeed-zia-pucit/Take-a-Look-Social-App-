

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

    // final appleProvider = FacebookAuthProvider();
    // UserCredential userCredential = await FirebaseAuth.instance.signInWithProvider(appleProvider);
    // User? user = userCredential.user;
    // return user;

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
      // final credential = await SignInWithApple.getAppleIDCredential(
      //   scopes: [
      //     AppleIDAuthorizationScopes.email,
      //     AppleIDAuthorizationScopes.fullName,
      //   ],
      // );
      // print(credential);

      // AuthorizationResult authorizationResult = await TheAppleSignIn.performRequests([const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])]);

      // final appleProvider = AppleAuthProvider().addScope('email').addScope('name');
      // appleProvider.addScope('email');
      // appleProvider.addScope('name');
      // UserCredential userCredential = await FirebaseAuth.instance.signInWithProvider(appleProvider);
      // User? user = userCredential.user;
      // return user;
    } catch (e) {
      return null;
    }

  }

  // String generateNonce([int length = 32]) {
  //   const charset =
  //       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //   final random = Random.secure();
  //   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
  //       .join();
  // }
  //
  // /// Returns the sha256 hash of [input] in hex notation.
  // String sha256ofString(String input) {
  //   final bytes = utf8.encode(input);
  //   final digest = sha256.convert(bytes);
  //   return digest.toString();
  // }
  //
  // @override
  // Future<User?> signInWithApple() async {
  //   // To prevent replay attacks with the credential returned from Apple, we
  //   // include a nonce in the credential request. When signing in with
  //   // Firebase, the nonce in the id token returned by Apple, is expected to
  //   // match the sha256 hash of `rawNonce`.
  //   final rawNonce = generateNonce();
  //   final nonce = sha256ofString(rawNonce);
  //
  //   // Request credential for the currently signed in Apple account.
  //   final appleCredential = await SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //     nonce: nonce,
  //   );
  //
  //   // Create an `OAuthCredential` from the credential returned by Apple.
  //   final oauthCredential = OAuthProvider("apple.com").credential(
  //     idToken: appleCredential.identityToken,
  //     rawNonce: rawNonce,
  //   );
  //
  //   // Sign in the user with Firebase. If the nonce we generated earlier does
  //   // not match the nonce in `appleCredential.identityToken`, sign in will fail.
  //   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  //   User? user = userCredential.user;
  //   return user;
  // }

}
