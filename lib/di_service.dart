
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:take_a_look/core/data/data_source/local/app_local_data.dart';
import 'package:take_a_look/core/data/repo/social_auth.dart';
import 'package:take_a_look/pages/sign_in_screens/forget/data/repo/forget_repo.dart';
import 'package:take_a_look/pages/sign_in_screens/sign_in/data/repo/sign_in_repo.dart';
import 'package:take_a_look/pages/sign_up_screens/note/data/repo/note_repo.dart';
import 'package:take_a_look/pages/sign_up_screens/note/data/repo/note_repo.dart';
import 'package:take_a_look/pages/sign_up_screens/profile/data/repo/profile_repo.dart';
import 'package:take_a_look/pages/sign_up_screens/setup_edit_profile/data/repo/setup_edit_profile_repo.dart';

import 'pages/hair_color_formula_screens/follow/data/repo/follow_repo.dart';
import 'pages/sign_up_screens/miscellaneous/data/repo/miscellaneous_repo.dart';
import 'pages/sign_up_screens/sign_up/data/repo/sign_up_repo.dart';

var getIt = GetIt.instance;

final header = {
  'accept' : 'application/json',
  'Content-Type' : 'application/json',
};
final  normalHeader = {
  'accept' : '*/*',
  'Content-Type' : 'application/json',
};

Map<String, dynamic> headerWithAuth(String? token) => {
  'accept' : 'application/json',
  'Content-Type' : 'application/json',
  "Authorization": "Bearer $token",
};
Map<String, dynamic> headerAuth(String? token) => {
  'accept' : '*/*',
  'Content-Type' : 'application/json',
  "Authorization": "Bearer $token",
};

Map<String, dynamic> headerWithAuthMultiPart(String? token) => {
  'accept' : '*/*',
  'Content-Type' : 'multipart/form-data',
  "Authorization": "Bearer $token",
};

Future<void> init() async {
  /// Hive
  await initHive();
  /// Get_it
  getItInit();
  /// Local database init
  // await GetStorage.init();
}

void getItInit() async {

  getIt

    ..registerLazySingleton(
          () => Dio()
        ..options = BaseOptions(
          // baseUrl: 'http://18.118.147.200:8445/api/',
          // baseUrl: 'http://18.218.231.128:8445/api/',
          // baseUrl: 'http://18.222.240.84:8445/api/',
          baseUrl: '${AppLocalData.BaseURL}',
          // baseUrl: 'http://3.142.45.117:8445/api/',
          headers: header,
          sendTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )
        ..interceptors.addAll(
          [
            LogInterceptor(
              requestBody: kDebugMode,
              responseBody: kDebugMode,
              logPrint: (object) =>
              kDebugMode ? log('dio: ${object.toString()}') : null,
            ),
            // chuck.getDioInterceptor(),
          ],
        ),
    )

  /// Data Sources
  //   ..registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl())
  //   ..registerLazySingleton<LoginLocalDataSource>(() => LoginLocalDataSourceImpl())
  //
  //   ..registerLazySingleton<CommonRemoteDataSource>(() => CommonRemoteDataSourceImpl())
  //   ..registerLazySingleton<CommonLocalDataSource>(() => CommonLocalDataSourceImpl())
  // ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
  // ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance,)

  /// Repository
    ..registerLazySingleton<SocialAuth>(() => SocialAuthImpl())
    ..registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl(getIt()))
    ..registerLazySingleton<SignInRepo>(() => SignInRepoImpl(getIt()))
    ..registerLazySingleton<ForgetRepo>(() => ForgetRepoImpl(getIt()))
    ..registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()))
    ..registerLazySingleton<SetupEditProfileRepo>(() => SetupEditProfileRepoImpl(getIt()))
    ..registerLazySingleton<MiscellaneousRepo>(() => MiscellaneousRepoImpl(getIt()))
    ..registerLazySingleton<NoteRepo>(() => NoteRepoImpl(getIt()))
    ..registerLazySingleton<FollowRepo>(() => FollowRepoImpl(getIt()));

  /// ViewModel
  //   ..registerSingleton<AuthViewModel>(AuthViewModel(),)

}

Future<void> initHive() async {

  await Hive.initFlutter();
  await Hive.openBox("appBox");

  // const boxName = 'appBox';
  // final Directory directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // _box = await Hive.openBox<dynamic>(boxName);
}
