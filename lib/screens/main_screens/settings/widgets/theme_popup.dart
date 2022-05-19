
import 'package:coin_wise/screens/main_screens/settings/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/config/app_themes.dart';


class ThemePopup extends StatelessWidget {
  const ThemePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        RadioButton(text: 'Light', selection: currentTheme.lightTheme),
        RadioButton(text: 'Dark', selection: currentTheme.darkTheme),
      ],
    );
  }
}
