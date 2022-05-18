//_________________CATEGORY SELECTION DROP DOWN _______________

import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/logic/bloc/transactions/transactions_bloc.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/add_screen.dart';
import 'package:coin_wise/screens/action_screens/categories/widgets/add_category.dart';
import 'package:coin_wise/widgets/common_container.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

CategoryModel? globalCategory;

class CategoryDropdown extends StatefulWidget {
  final List<CategoryModel> items;
  final BuildContext contxt;
  final TransactionsState newState;
  // final bool isAdd;
  const CategoryDropdown(
      {required this.contxt,
      required this.items,
      Key? key,
      // required this.isAdd,
      required this.newState})
      : super(key: key);

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

          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return DropdownButton(
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
                items: widget.newState.isAdd
                    ? state.incomeCategoryList.map((e) {
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(
                            e.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          onTap: () {
                            globalCategory = e;
                          },
                        );
                      }).toList()
                    : state.expenseCategoryList.map((e) {
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(
                            e.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          onTap: () {
                            globalCategory = e;
                          },
                        );
                      }).toList(),
                onChanged: (value) {
                  context.read<TransactionsBloc>().add(TransactionController(
                      isAdd: true,
                      isIncome: true,
                      categories: state.categoryList,
                      dropDownValue: value.toString()));
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
