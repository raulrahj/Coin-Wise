import 'package:flutter/material.dart';
const Color primaryColor = Color.fromARGB(100, 153, 237, 197);
const Color primaryGrey = Color(0Xff444444);
const Color primaryBlack = Color.fromARGB(97, 12, 12, 12);
const Color primaryRed = Color.fromARGB(255, 252, 209, 148);
const Color primaryRedDark = Color.fromARGB(255, 129, 103, 66);

const Color defaultColor = Color(0xFF019267);
const Color defaultPrimaryColor = Color(0xFFDFDFDE);
const Color defaultLightColor = Color(0xFFF7F5F2);

const Color defaultColorDark = Color(0XFF044A42);
const Color defaultPrimaryColorDark = Color(0xFF1d1716);
const Color defaultLightColorDark = Color(0xFFB8E1DD);
const Color defaultScaffoldDark = Color(0xFF1F1F1F);
const Color defaultGreyDark = Color(0xFFEEEEEE);


const Gradient defaultGradient = LinearGradient(colors: <Color>[
  Color.fromARGB(236, 204, 253, 192),
  Color.fromARGB(202, 255, 255, 255)
], begin: Alignment.topCenter, end: Alignment.bottomCenter);

const Color primaryGreyDark = Color.fromARGB(255, 146, 145, 145);
const Color primaryGreeenLight = Color(0xFF84bc9c);
const Color primaryLight = Color(0xFFfffdf7);
const Color primaryDark = Color(0xFF3A3845);

Color colour(context) {
  Color colour = Theme.of(context).primaryColor;
  return colour;
}

  const _blackPrimaryValue = 0xFF000000;

   const MaterialColor black =  MaterialColor(
    _blackPrimaryValue,
     <int, Color>{
      50:   Color(0xFFe0e0e0),
      100:  Color(0xFFb3b3b3),
      200:  Color(0xFF808080),
      300:  Color(0xFF4d4d4d),
      400:  Color(0xFF262626),
      500:  Color(_blackPrimaryValue),
      600:  Color(0xFF000000),
      700:  Color(0xFF000000),
      800:  Color(0xFF000000),
      900:  Color(0xFF000000),
    },
  );