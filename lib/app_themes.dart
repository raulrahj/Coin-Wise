import 'package:coin_wise/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';

enum currentTheme {
  lightTheme,
  darkTheme,
}
ValueNotifier <currentTheme> themeListenable = ValueNotifier(currentTheme.lightTheme) ;

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: defaultScaffoldDark,
      brightness: Brightness.dark,
      dialogBackgroundColor: defaultColorDark,
      primaryColor: primaryBlack,
      colorScheme: const ColorScheme.dark(),
      snackBarTheme: const SnackBarThemeData(backgroundColor: defaultColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryGrey,
          selectedIconTheme: IconThemeData(color: defaultPrimaryColor)),
      fontFamily: 'Antic',
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: primaryGrey,
        indicatorColor: primaryLight,
      ),
      textTheme: const TextTheme());
  static final lightTheme = ThemeData();
}
