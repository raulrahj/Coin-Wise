
//_______________________________________SWITH BUTTON___________________________


import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/functions.dart';
import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  SwitchClass createState() => SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = true;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(
        () {
          isSwitched = true;
          notifications();
        },
      );
    } else {
      setState(
        () {
          isSwitched = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Theme.of(context).iconTheme.color,
            activeTrackColor: defaultGreyDark,
            inactiveTrackColor: primaryRed,
          ),
        ),
      ],
    );
  }
}
