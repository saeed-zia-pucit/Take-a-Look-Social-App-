
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/di_service.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/view_model/hair_color_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/miscellaneous/view_model/miscellaneous_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/note/view_model/note_view_model.dart';

import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'core/view_model/global_view_model.dart';
import 'firebase_options.dart';
import 'pages/sign_in_screens/verify/view_model/verify_view_model.dart';
import 'pages/sign_up_screens/profile/view_model/profile_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
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
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MiscellaneousViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoteViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HairColorViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppThemeViewModel(),
        ),
      ],
      builder: (context, _) {
        return Consumer<AppThemeViewModel>(
          builder: (context, viewModel, _) {
            return MaterialApp.router(
              routerConfig: router,
              title: 'Flutter Demo',
              themeMode: viewModel.themeMode,
              theme: lightTheme(context),
            );
          }
        );
      }
    );
  }
}
