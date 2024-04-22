
import 'package:get_it/get_it.dart';
import 'package:take_a_look/core/data/repo/social_auth.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Get_it
  getItInit();
  /// Local database init
  // await GetStorage.init();
}

void getItInit() async {
  getIt

  /// Data Sources
  //   ..registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl())
  //   ..registerLazySingleton<LoginLocalDataSource>(() => LoginLocalDataSourceImpl())
  //
  //   ..registerLazySingleton<CommonRemoteDataSource>(() => CommonRemoteDataSourceImpl())
  //   ..registerLazySingleton<CommonLocalDataSource>(() => CommonLocalDataSourceImpl())
  // ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
  // ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance,)

  /// Repository
    ..registerLazySingleton<SocialAuth>(() => SocialAuthImpl());

  /// ViewModel
  //   ..registerSingleton<AuthViewModel>(AuthViewModel(),)

}
