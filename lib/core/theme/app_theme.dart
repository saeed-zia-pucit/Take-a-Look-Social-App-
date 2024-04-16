
part of 'theme.dart';

class AppThemeViewModel extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  /// Theme changer
  void changeTheme(ThemeModes theme) {
    switch (theme) {
      case ThemeModes.LightTheme:
        themeMode = ThemeMode.light;
      case ThemeModes.DarkTheme:
        themeMode = ThemeMode.dark;
      case ThemeModes.SystemTheme:
        themeMode = ThemeMode.system;
    }
    notifyListeners();
  }
}

// ignore: constant_identifier_names
enum ThemeModes { LightTheme, DarkTheme, SystemTheme }
