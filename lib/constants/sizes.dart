import 'package:flutter/material.dart';

const EdgeInsetsGeometry all8 =  EdgeInsets.all(8.0);
const EdgeInsetsGeometry all15 =  EdgeInsets.all(15.0);

const EdgeInsetsGeometry decent =
     EdgeInsets.symmetric(horizontal: 15.0, vertical: 8);
const EdgeInsetsGeometry decent0 =
     EdgeInsets.symmetric(horizontal: 8.0, vertical: 0);
const EdgeInsetsGeometry decent1 =
     EdgeInsets.symmetric(horizontal: 29.0, vertical: 8);
const EdgeInsetsGeometry decent2 =
     EdgeInsets.symmetric(horizontal: 12.0, vertical: 8);

const Widget decentSpace = SizedBox(
  height: 40,
);
const Widget decentSpace20 = SizedBox(
  height: 20,
);
const Widget blockSpace = SizedBox(
  height: 100,
);
const Widget decentHieght = SizedBox(
  width: 10,
);
const Widget decentWidth = SizedBox(
  width: 10,
);
const Widget bottomSpace = SizedBox(
  height: 220,
);

double displayWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double displayHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
