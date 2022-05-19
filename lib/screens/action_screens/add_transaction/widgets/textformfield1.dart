
//________________________ TEXT FIELD IN ACTION SCREEN ________________________

import 'package:coin_wise/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ActionBox extends StatelessWidget {
  var data = TextEditingController();
  String? hint;
  bool? trail;
  Color itemColor;
  TextEditingController? controller;
  TextInputType? keyboardtype;
  Widget? prefix;
  String? Function(String?)? validator;
  Function()? onTap;
  Color? activeColor;
  TextStyle? style;
  ActionBox(
      {this.hint,
      this.itemColor = primaryDark,
      this.controller,
      this.keyboardtype,
      this.prefix,
      this.validator,
      key,
      this.activeColor,
      this.style,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return TextFormField(
      onTap: onTap,
      validator: validator,
      style: style ?? TextStyle(color: itemColor),
      controller: controller,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        labelText: hint,
        suffixIcon: trail == true
            ? GestureDetector(
                child: const Icon(Icons.add_photo_alternate_outlined),
                onTap: () {
                  print('add photo clicked');
                },
              )
            : null,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: activeColor ?? itemColor)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: activeColor ?? itemColor,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        labelStyle: TextStyle(color: activeColor ?? itemColor, fontSize: 16),
      ),
    );
  }
}
