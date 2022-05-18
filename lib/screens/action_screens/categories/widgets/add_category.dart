
//__________________POPUP FOR ADD NEW CATEGORY_____________________________


import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/add_screen.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _categoryNameController = TextEditingController();

class AddCategoryPopup extends StatefulWidget {
  AddCategoryPopup({popupTitle, Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  State<AddCategoryPopup> createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColor;
    return AlertDialog(
      backgroundColor: bg,
      title: Row(
        children: [
          decentWidth,
          const Icon(Icons.add_box),
          //<<<<<<<<<<<<< TITLE >>>>>>>>>>>>>>
          Text(
            ' ADD NEW CATEGORY',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
      content: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        height: displayHeight(context) * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            // >>>>>>>>>>>> CATEGORY CONTROLLER TEXTFORM FIELD <<<<<<<<<<<<<
            Form(
              key: widget._formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter category name !';
                  } else {
                    return null;
                  }
                },
                controller: _categoryNameController,
                decoration: InputDecoration(
                  labelText: 'Category name',
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryBlack)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).iconTheme.color!),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 18),
                ),
              ),
            ),
            Container(
              width: displayWidth(context) * .76,
              height: displayHeight(context) * .070,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Theme.of(context).iconTheme.color!,
                ),
              ),
              //>>>>>>> CATEGORY FIELD SELECTION DROPDOWN <<<<<<<<<<<<<<<<<
              child: DropdownButton(
                underline: const SizedBox(),
                alignment: Alignment.centerRight,
                value: dropValue,
                icon: SizedBox(
                  width: displayWidth(context) * .04,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.arrow_drop_down)),
                ),
                items: fields.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(
                        width: displayWidth(context) * .55,
                        child: Text(
                          '  ' + items,
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropValue = value.toString();

                    if (value == fields[1]) {
                      categoryType = 1;
                    } else {
                      categoryType = 0;
                    }
                  });
                },
              ),
            ),
            //>>>>>>>>>> ADD BUTTON <<<<<<<<<
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              // color: Theme.of(context).iconTheme.color,
              child: const Text('Done'),
              onPressed: () {
                if (widget._formKey.currentState!.validate()) {
                  @override
                  final _categories = CategoryModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: _categoryNameController.text,
                      field: categoryType == 0
                          ? CategoryField.income
                          : CategoryField.expense);
                          context.read<CategoryBloc>().add(AddCategory(model: _categories));
                  // CategoryFunctions().insertCategory(_categories);
                  _categoryNameController.clear();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      width: displayWidth(context) * 03,
                      behavior: SnackBarBehavior
                          .floating, //behavior used to change decoration or change default config
                      // margin: const EdgeInsets.all(10),
                      backgroundColor: defaultColor,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Added ${_categoryNameController.text}...',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      )));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

//________________________________________________ADD CATEGROY POPUP SCREEN END_____________________________________________//
