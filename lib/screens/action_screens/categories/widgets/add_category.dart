//__________________POPUP FOR ADD NEW CATEGORY_____________________________

import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _categoryNameController = TextEditingController();

class AddCategoryPopup extends StatefulWidget {
  final CategoryModel? oldData;

  AddCategoryPopup({popupTitle, Key? key, this.oldData}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  State<AddCategoryPopup> createState() => _AddCategoryPopupState();
  final _categoryUpdateNameController = TextEditingController();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColor;
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        context.read<CategoryBloc>().add(CategoryDropDownChange(
            newCategoryValue: state.categoryDropDown,
            isIncome: state.isIncome,
            isAdd: false));

        if (!state.isAdd && widget.oldData != null) {
          widget._categoryUpdateNameController.text = widget.oldData!.name;
        }
        return AlertDialog(
          backgroundColor: bg,
          title: Row(
            children: [
              decentWidth,
              const Icon(Icons.add_box),
              //<<<<<<<<<<<<< TITLE >>>>>>>>>>>>>>
              Text(
                state.isAdd ? ' ADD NEW CATEGORY' : ' UPDATE CATEGORY',
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
                    controller: state.isAdd
                        ? _categoryNameController
                        : widget._categoryUpdateNameController,
                    decoration: InputDecoration(
                      labelText: 'Category name',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryBlack)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color!),
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
                      context.read<CategoryBloc>().add(CategoryDropDownChange(
                          newCategoryValue: value.toString(),
                          isIncome: state.isIncome,
                          isAdd: state.isAdd));
                      dropValue = state.categoryDropDown;

                      if (value == fields[1]) {
                        context.read<CategoryBloc>().add(CategoryDropDownChange(
                            newCategoryValue: state.categoryDropDown,
                            isIncome: false,
                            isAdd: state.isAdd));
                      } else {
                        context.read<CategoryBloc>().add(CategoryDropDownChange(
                            newCategoryValue: state.categoryDropDown,
                            isIncome: true,
                            isAdd: state.isAdd));
                      }
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
                      if (state.isAdd) {
                        if (widget._formKey.currentState!.validate()) {
                          @override
                          final _categories = CategoryModel(
                              id: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              name: _categoryNameController.text,
                              field: state.isIncome
                                  ? CategoryField.income
                                  : CategoryField.expense);
                          context
                              .read<CategoryBloc>()
                              .add(AddCategory(model: _categories));
                          // CategoryFunctions().insertCategory(_categories);
                          _categoryNameController.clear();
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
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
                              ),
                            ),
                          );
                        }
                      } else if (!state.isAdd && widget.oldData != null) {
                        @override
                        final _newCategories = CategoryModel(
                            id: widget.oldData!.id,
                            name: widget._categoryUpdateNameController.text,
                            field: state.isIncome
                                ? CategoryField.income
                                : CategoryField.expense);
                        context
                            .read<CategoryBloc>()
                            .add(UpdateCategory(model: _newCategories));
                        // CategoryFunctions().updateCategory(_newCategories);
                        widget._categoryUpdateNameController.clear();
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            width: displayWidth(context) * .5,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: defaultColor,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Updated...',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}

//________________________________________________ADD CATEGROY POPUP SCREEN END_____________________________________________//
