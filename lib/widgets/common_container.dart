
//________________________ COMMON CONTAINER BOX________________________________

import 'package:coin_wise/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget showBox(
    {Widget? item,
    double? x,
    double? y,
    Color? color,
    AlignmentGeometry? alignment}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: color ?? defaultColor),
    width: x ?? 130,
    height: y ?? 70,
    child: item,
    alignment: alignment,
  );
}
