
//__________ TEXTFORM FIELD IN SETUP PROFILE__________________


import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TextFormBox extends StatelessWidget {
  TextFormBox(
      {Key? key, this.hint, this.profileformController, this.validation})
      : super(key: key);
  final String? hint;
  final TextEditingController? profileformController;
  String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: displayWidth(context) * .85,
        height: displayHeight(context) * .07,
        color: Colors.transparent,
        child: TextFormField(
          controller: profileformController,
          validator: validation,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(color: Color(0xFF8D8DAA)),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryDark),
              borderRadius: BorderRadius.circular(25.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: primaryDark),
            ),
          ),
          style: const TextStyle(color: primaryDark),
        ),
      ),
    );
  }
}
