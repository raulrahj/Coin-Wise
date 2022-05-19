//____________________ DEFAULT CONTAINER _________________________________

import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:flutter/material.dart';

Widget defaultContainer(
    {required Widget item,
    double? height,
    Color? color,
    EdgeInsetsGeometry? padding,
    List<BoxShadow>? boxShadow,
    Color? shadowClr}) {
  return Padding(
      padding: padding ?? decent2,
      child: Opacity(
        opacity: 1,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: shadowClr ?? primaryBlack,
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: .5,
                  ),
                ], //B,
            color: color ?? const Color(0xFFDFDFDE),
            // gradient: defaultBoxGradient,
            borderRadius: BorderRadius.circular(15),
          ),
          width: double.infinity,
          height: height,
          child: item,
        ),
      ));
}
