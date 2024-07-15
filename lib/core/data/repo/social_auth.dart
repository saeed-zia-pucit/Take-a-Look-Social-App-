import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data_source/local/app_local_data.dart';
import '../models/user_model.dart';

abstract class SocialAuth {
  Future<User?> signInWithGoogle();

  Future<User?> signInWithFacebook();

  Future<User?> signInWithApple();

  Future<bool?> deleteAccount();

  Future<bool?> logOut();

  Future<UserModel?> socialSignUp(
      UserModel userModel, String socialAccountType);
}

class SocialAuthImpl extends SocialAuth {
  SocialAuthImpl(this.dio);

  final Dio dio;

  @override
  Future<UserModel?> socialSignUp(
      UserModel userModel, String socialAccountType) async {
    try {
      final Response response = await dio.post(
        '/auth/signup?provider=$socialAccountType',
        data: userModel.toSignUpJson,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);

        UserModel userModelIn = UserModel.fromSignUp(response.data);
        UserModel userModelFull = userModel.copyWith(
          token: userModelIn.token,
          refreshToken: userModelIn.refreshToken,
        );

        await AppLocalData.saveUserModel(userModelFull);
        await AppLocalData.saveUserToken(userModelFull.token);
        await AppLocalData.saveUserRefreshToken(userModelFull.refreshToken);

        return userModelFull;
      }
      return null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 409) {
        // Email already exists, attempt to sign in
        print('Email already exists, attempting to sign in...');


      } else {
        // Handle other DioErrors
        print('Signup error: ${e.message}');
      }
    } catch (e) {
      // Handle non-Dio errors
      print('Unexpected error: $e');
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
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
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = userCredential.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> signInWithApple() async {
    try {
      final appleProvider =
          AppleAuthProvider().addScope('email').addScope('name');
      appleProvider.addScope('email');
      appleProvider.addScope('name');
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);
      User? user = userCredential.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> logOut() async {
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
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> deleteAccount() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      // final providerData = firebaseAuth.currentUser?.providerData.first;
      //
      // if (AppleAuthProvider().providerId == providerData!.providerId) {
      //   /// Apple
      //   await firebaseAuth.currentUser!.reauthenticateWithProvider(AppleAuthProvider());
      // } else if (GoogleAuthProvider().providerId == providerData.providerId) {
      //   /// Google
      //   await firebaseAuth.currentUser!.reauthenticateWithProvider(GoogleAuthProvider());
      // } else if (FacebookAuthProvider().providerId == providerData.providerId) {
      //   /// Facebook
      //   await firebaseAuth.currentUser!.reauthenticateWithProvider(FacebookAuthProvider());
      // }
      await firebaseAuth.currentUser?.delete();
      await logOut();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
