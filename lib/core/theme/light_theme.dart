
part of 'theme.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(primary: const Color.fromRGBO(244, 147, 184, 1), seedColor: const Color.fromRGBO(244, 147, 184, 1)),

    /// Scaffold Background Color
    scaffoldBackgroundColor: AppColors.whiteColor,

    /// AppBar Theme
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.nunito(
        fontSize: 18,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: const IconThemeData(
        size: 18,
      ),
      surfaceTintColor: AppColors.whiteColor,
      backgroundColor: AppColors.whiteColor,
      // foregroundColor: Colors.red
    ),

    /// ElevatedButton Theme
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

    /// OutlinedButton Theme
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

    /// Text Theme
    textTheme: TextTheme(
        bodyMedium: GoogleFonts.nunito()
    ),

    /// TextButton Theme
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

    /// FloatingActionButton Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      foregroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
    ),

  );
}
