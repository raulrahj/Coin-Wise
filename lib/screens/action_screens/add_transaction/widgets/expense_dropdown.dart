import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/add_screen.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/widgets/dropdown_category.dart';
import 'package:coin_wise/screens/action_screens/categories/widgets/add_category.dart';
import 'package:coin_wise/widgets/common_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseDropDown extends StatelessWidget {
  const ExpenseDropDown({Key? key}) : super(key: key);

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
// *<<<<<<<<<<<<<<<<<<<<<<< DROPDOWNN SECTION - ADD TRANSACTION SCREEN >>>>>>>>>>>>>>>>>>>>>>>>>

          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return DropdownButton<String>(
                underline: const SizedBox(),
                hint: Text(
                  '    Select Category',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16, color: primaryLight),
                ),
                items: state.expenseCategoryList.map((CategoryModel value) {
                  return DropdownMenuItem<String>(
                    value: value.name,
                    child: Text(value.name),
                onTap: (){globalCategory = value;},
                  );
                }).toList(),
                // onTap: (){globalCategory = value},
                onChanged: (value) {
                  // globalCategory = value;
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
