
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/number_extension.dart';
import 'package:take_a_look/pages/sign_up_screens/miscellaneous/view_model/miscellaneous_view_model.dart';

import 'constants/app_colors.dart';
import 'core/router/router.dart';
import 'pages/sign_in_screens/verify/view_model/verify_view_model.dart';
import 'pages/sign_up_screens/profile/view_model/profile_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VerifyViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MiscellaneousViewModel(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(primary: const Color.fromRGBO(244, 147, 184, 1), seedColor: const Color.fromRGBO(244, 147, 184, 1)),
            useMaterial3: true,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(AppColors.primaryColor),
                fixedSize: MaterialStatePropertyAll(Size(1.wp(context), 50.h(context))),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                textStyle: MaterialStatePropertyAll(GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
                backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
                foregroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                side: MaterialStatePropertyAll(BorderSide(color: AppColors.primaryColor)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
                ),
              )
            ),
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.nunito()
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: GoogleFonts.nunito(
                fontSize: 18,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              iconTheme: const IconThemeData(
                size: 18
              )
            ),
            textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )
                )
              )
            ),
            scaffoldBackgroundColor: AppColors.whiteColor,
          ),
        );
      }
    );
  }
}
