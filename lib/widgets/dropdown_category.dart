
//_________________CATEGORY SELECTION DROP DOWN _______________

import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/screens/action_screens/categories/widgets/add_category.dart';
import 'package:coin_wise/widgets/common_container.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';

CategoryModel? globalCategory;

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({required this.contxt, this.item, Key? key})
      : super(key: key);
  final List? item;
  final BuildContext contxt;

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

String? dropDownValue;

class _CategoryDropdownState extends State<CategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    return showBox(
      x: displayWidth(context),
      y: displayHeight(context) * .06,
      color: Theme.of(context).primaryColorDark,
      item: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
//<<<<<<<<<<<<<<<<<<<<<<< DROPDOWNN SECTION - ADD TRANSACTION SCREEN >>>>>>>>>>>>>>>>>>>>>>>>>

          DropdownButton(
            hint: Text(
              '    Select Category',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16, color: primaryLight),
            ),
            underline: const SizedBox(),
            alignment: Alignment.center,
            value: dropDownValue,
            icon: SizedBox(
              width: displayWidth(context) * .1,
              child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: primaryLight,
                  )),
            ),
            items: (categoryMod == 0)
                ? CategoryFunctions.instance.incomeCategoryListner.value
                    .map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text(
                        e.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      onTap: () {
                        globalCategory = e;
                      },
                    );
                  }).toList()
                : CategoryFunctions.instance.expenseCategoryListner.value
                    .map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text(
                        e.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      onTap: () {
                        globalCategory = e;
                      },
                    );
                  }).toList(),
            onChanged: (value) {
              /** To  Do */
              setState(
                () {
                  dropDownValue = value.toString();
                },
              );
            },
          ),
          TextButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColorDark,
                elevation: 0,
                shadowColor: defaultColor),
            onPressed: () {
              //>>>>>> NEW CATEGORY ADDING POPUP <<<<<<<<<
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AddCategoryPopup();
                },
              );
              // (cntx: context,);
            },
            //<<< ADD TRANSACTION SCREEN DROPDOWN POSITION  >>>>

            icon: const Icon(
              Icons.add_box,
              size: 18,
            ),

            label: const Text('New category'),
          ),
        ],
      ),
    );
  }
}
