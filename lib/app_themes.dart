import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum currentTheme {
  lightTheme,
  darkTheme,
}
ValueNotifier<currentTheme> themeListenable = ValueNotifier(
    dark == true ? currentTheme.darkTheme : currentTheme.lightTheme);

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: defaultScaffoldDark,
      brightness: Brightness.dark,
      dialogBackgroundColor: defaultColorDark,
      primaryColor: defaultColorDark,
      colorScheme: const ColorScheme.dark(),
      snackBarTheme: const SnackBarThemeData(backgroundColor: defaultColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryGrey,
        selectedIconTheme: IconThemeData(color: defaultPrimaryColor),
      ),
      fontFamily: 'Antic',
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: primaryGrey,
        indicatorColor: primaryLight,
      ),
      primaryColorLight: defaultPrimaryColorDark,
      primaryColorDark: defaultColorDark,
      primarySwatch: black,
      // backgroundColor: defaultPrimaryColorDark,
      
      textTheme: const TextTheme());
  static final lightTheme = ThemeData(
    fontFamily: 'Antic',
    scaffoldBackgroundColor: primaryLight,
    // primarySwatch: defaultLightColor,
    dialogBackgroundColor: defaultPrimaryColor,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    primaryColor: defaultPrimaryColor,
    primaryColorLight: defaultPrimaryColor,
    primaryColorDark: defaultColor,
    primarySwatch: black
    // backgroundColor: defaultColor
    //  canvasColor:
  );
}

class ThemePreferences {
  static const PREF_KEY = "pref_key";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY) ?? false;
  }
}

class ThemeModel extends ChangeNotifier {
  bool _isDark = true;
  ThemePreferences _preferences = ThemePreferences();
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }
  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
