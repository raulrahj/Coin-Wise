import 'package:coin_wise/main.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/text_styles.dart';
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
    indicatorColor: primaryRedDark,
    dialogTheme: const DialogTheme(
      backgroundColor: defaultColorDark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    ),
    selectedRowColor: const Color.fromARGB(255, 48, 113, 51),
    iconTheme: const IconThemeData(color: primaryGreyDark),
    chipTheme: const ChipThemeData(backgroundColor: defaultPrimaryColorDark),
    textTheme: const TextTheme(
        titleMedium: boxSubBoldTitleDark,
        titleSmall: TextStyle(
          color: defaultLightColorDark,
        ),
        titleLarge: boxTitle),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryGrey),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: defaultColorDark,
      shadowColor: primaryGrey,
      elevation: 3,
      minimumSize: const Size(190, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    )),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: primaryLight, textStyle:const TextStyle(color: primaryBlack,),backgroundColor: Colors.transparent)),
  );
  static final lightTheme = ThemeData(
    fontFamily: 'Antic',
    scaffoldBackgroundColor: primaryLight,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    primaryColor: defaultPrimaryColor,
    primaryColorLight: defaultPrimaryColor,
    primaryColorDark: defaultColor,
    indicatorColor: primaryRed,
    selectedRowColor: defaultColor,
    dialogTheme: const DialogTheme(
      backgroundColor: defaultPrimaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    ),
    iconTheme: const IconThemeData(color: primaryGrey),
    chipTheme: const ChipThemeData(backgroundColor: defaultPrimaryColor),
    textTheme: const TextTheme(
        titleMedium: boxSubBoldTitle,
        titleSmall: TextStyle(
          color: primaryGrey,
        ),
        titleLarge: boxTitle),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: defaultColor,
      onPrimary: primaryLight,
      shadowColor: primaryGrey,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      minimumSize: const Size(190, 45),
    )),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryLight,
        textStyle:const TextStyle(color: primaryBlack),
      ),
    ),
    backgroundColor: primaryRed,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: defaultColor),
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
