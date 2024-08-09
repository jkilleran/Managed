import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier {
  bool _isDarkModeEnabled = false;

  ThemeData get currentTheme => _isDarkModeEnabled
      ? ThemeData.dark().copyWith(
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.red,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          toggleableActiveColor: Colors.red, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
        )
      : _getThemeLight();

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void setDarkMode(bool b) {
    _isDarkModeEnabled = b;
    notifyListeners();
  }

  ThemeData _getThemeLight() {
    final theme = ThemeData(
      primarySwatch: Colors.deepPurple,
    );

    return theme;
  }
}
