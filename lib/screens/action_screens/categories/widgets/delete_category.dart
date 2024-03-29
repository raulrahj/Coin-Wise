//______________________________ CATEGORY DELETION POPUP SCREEN___________________

import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget deletionPopup(context, String value) {
  return SimpleDialog(
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Are you want to delete this\ncategory ?'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
            TextButton(
                onPressed: () async {
                  // CategoryFunctions.instance.deleteCategory(value, context);
                  context.read<CategoryBloc>().add(DeleteCategory(keey: value));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior
                          .floating, //behavior used to change decoration or change default config
                      margin: EdgeInsets.all(10),
                      backgroundColor: defaultColor,
                      content: Text(
                        'Deleted !',
                        style: TextStyle(color: Colors.white),
                      )));
                },
                child: Text('OK',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),),),
          ],
        )
      ],
    ),
  );
}
