import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/di_service.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/view_model/hair_color_view_model.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/data/repo/add_portfolio_repo.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/data/repo/feed_repo.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/view_model/add_portfolio_view_model.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/view_model/feed_view_model.dart';
import 'package:take_a_look/pages/sign_in_screens/forget/view_model/forget_view_model.dart';
import 'package:take_a_look/pages/sign_in_screens/sign_in/view_model/sign_in_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/miscellaneous/view_model/miscellaneous_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/note/view_model/note_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/setup_edit_profile/view_model/setup_edit_profile_view_model.dart';

import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'core/view_model/global_view_model.dart';
import 'firebase_options.dart';
import 'pages/hair_color_formula_screens/follow/view_model/follow_view_model.dart';
import 'pages/sign_in_screens/verify/view_model/verify_view_model.dart';
import 'pages/sign_up_screens/notification/view_model/norification_view_model.dart';
import 'pages/sign_up_screens/profile/view_model/profile_view_model.dart';
import 'pages/sign_up_screens/sign_up/view_model/signup_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GlobalViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => VerifyViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProfileViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => MiscellaneousViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => NoteViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => HairColorViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => AppThemeViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => SignUpViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => SetupEditProfileViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => SignInViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => ForgetViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => FollowViewModel(getIt()),
          ),
          ChangeNotifierProvider(
            create: (context) => NotificationViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                AddPortfolioViewModel(AddPortfolioRepoImpl(Dio())),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                FeedViewModel(FeedRepoImpl(Dio())),
          ),
        ],
        builder: (context, _) {
          return Consumer<AppThemeViewModel>(builder: (context, viewModel, _) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              title: 'Take a look',
              themeMode: viewModel.themeMode,
              theme: lightTheme(context),
            );
          });
        });
  }
}
