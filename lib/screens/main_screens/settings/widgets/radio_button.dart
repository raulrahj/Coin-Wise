import 'package:coin_wise/config/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RadioButton extends StatelessWidget {
  final String text;
  final currentTheme selection;

  const RadioButton({Key? key, required this.text, required this.selection})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeListenable,
        builder: (context, currentTheme newValue, child) {
          return Row(
            children: [
              // Consumer<ThemeModel>(
              //     builder: (context, ThemeModel themeNotifier, child) {
              //   return
                 Radio<currentTheme>(
                    activeColor: Theme.of(context).iconTheme.color,
                    value: selection,
                    groupValue: newValue,
                    onChanged: (value) async {
                      if (value == null) {
                        return;
                      } else {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                            if(value ==currentTheme.lightTheme){
                            sharedPreferences.setBool(ThemePreferences.PREF_KEY, false);
                            }else{
                              sharedPreferences.setBool(ThemePreferences.PREF_KEY, true);
                            }
                      }
                      themeListenable.value = value;
                      themeListenable.notifyListeners();
                      if (value == currentTheme.lightTheme) {
                        // themeNotifier.isDark
                        // ?
                        // themeNotifier.isDark = false;
                      } else {
                        // :
                        // themeNotifier.isDark = true;
                      }
                    }),
              // }),
              Text(text),
            ],
          );
        });
  }
}
