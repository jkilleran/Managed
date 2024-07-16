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
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red), checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.red; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.red; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.red; }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return Colors.red; }
 return null;
 }),
 ),
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
