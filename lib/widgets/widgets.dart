import 'package:coin_wise/app_themes.dart';
import 'package:coin_wise/constants/data.dart';
import 'package:coin_wise/constants/functions.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/main.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/screens/main_screens/home.dart';
import 'package:coin_wise/widgets/list_views.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/screens/action_screens/add_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../main.dart';

final _categoryNameController = TextEditingController();

var dropValue = fields[0];
int? categoryMod;
DateTime? date;
//____________________ DEFAULT CONTAINER _________________________________

Widget defaultContainer({required Widget item, double? height, Color? color}) {
  return Padding(
      padding: decent2,
      child: Opacity(
        opacity: 1,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: primaryBlack,
                offset: Offset(
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

//<<<<<<<<<<<<<< VERTICAL DEVIDER >>>>>>>>>
Widget verticalDivider = Container(
  height: 40,
  width: 3,
  color: brightness != Brightness.light ? defaultColor : defaultGreyDark,
);

//__________ TEXTFORM FIELD IN SETUP PROFILE__________________

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
            //fillColor: Colors.green
          ),
          // validator: (val) {
          //   if(val.length==0) {
          //     return "Email cannot be empty";
          //   }else{
          //     return null;
          //   }
          // },
          // keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
              // fontFamily: "Poppins",
              ),
        ),
      ),
    );
  }
}

//______________ COMMON USED BUTTON ________________
Widget defaultButton({
  String text = '',
  required void Function()? onPressed,
  Color? color,
  TextStyle? style,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: style ?? onboardTitle,
    ),
    style: ElevatedButton.styleFrom(
      primary: color ?? defaultColor,
      onPrimary: Colors.white,
      shadowColor: primaryGrey,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      minimumSize: const Size(190, 45),
    ),
  );
}

//________________________ COMMON CONTAINER BOX________________________________

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

//________________________ TEXT FIELD IN ACTION SCREEN ________________________

class ActionBox extends StatelessWidget {
  var data = TextEditingController();
  String? hint;
  bool? trail;
  Color itemColor;
  TextEditingController? controller;
  TextInputType? keyboardtype;
  Widget? prefix;
  String? Function(String?)? validator;

  ActionBox(
      {this.hint,
      this.itemColor = primaryDark,
      this.controller,
      this.keyboardtype,
      this.prefix,
      this.validator,
      key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return TextFormField(
      validator: validator,
      style: TextStyle(color: itemColor),
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
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: itemColor)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: itemColor,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        labelStyle: TextStyle(color: itemColor),
      ),
    );
  }
}

//_________________CATEGORY SELECTION DROP DOWN _______________
CategoryModel? globalCategory;

class CategoryDropdown extends StatefulWidget {
  CategoryDropdown({required this.contxt, this.item, Key? key})
      : super(key: key);
  final List? item;
  BuildContext contxt;

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
      color: defaultColor,
      item: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
//<<<<<<<<<<<<<<<<<<<<<<< DROPDOWNN SECTION - ADD TRANSACTION SCREEN >>>>>>>>>>>>>>>>>>>>>>>>>

          DropdownButton(
            hint: const Text('    Select Category'),
            underline: const SizedBox(),
            alignment: Alignment.center,
            value: dropDownValue,
            icon: SizedBox(
              width: displayWidth(context) * .2,
              child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )),
            ),
            items:
                //  CategoryFunctions.instance.expenseCategoryListner.value
                //     .map((e) {
                //   return DropdownMenuItem(
                //     child: Text(e.name),
                //     value: e.id,
                //     onTap: () => globalCategory = e,
                //   );
                // }).toList(),

                (categoryMod == 0)
                    ? CategoryFunctions.instance.incomeCategoryListner.value
                        .map((e) {
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(e.name),
                          onTap: () {
                            //dropDownValue= TransactionDbFunctions.instance.transactionIncomeListener.value[0].category;
                            globalCategory = e;
                          },
                        );
                      }).toList()
                    : CategoryFunctions.instance.expenseCategoryListner.value
                        .map((e) {
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(e.name),
                          onTap: () {
                            //  dropDownValue= TransactionDbFunctions.instance.transactionIncomeListener.value[0].category;
                            globalCategory = e;
                          },
                        );
                      }).toList(),
            onChanged: (value) {
              /** To  Do */
              setState(
                () {
                  dropDownValue = value.toString();
                  //dropDownValue = null;
                },
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: defaultColor, elevation: 0, shadowColor: defaultColor),
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.add_box,
                  size: 18,
                ),
                Text('New category'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//_______________________________________SWITH BUTTON___________________________

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  SwitchClass createState() => SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = true;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(
        () {
          isSwitched = true;
          notifications();
          // AwesomeNotifications().actionStream.listen((event) {
          //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
          //     return const addTransactionPopup();
          // }));
          // });
        },
      );
    } else {
      setState(
        () {
          isSwitched = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: brightness != Brightness.light
                ? primaryDark
                : defaultPrimaryColorDark,
            activeTrackColor:
                brightness != Brightness.light ? primaryGrey : defaultGreyDark,
            inactiveThumbColor: primaryRed,
            inactiveTrackColor:
                brightness != Brightness.light ? primaryGrey : defaultGreyDark,
          ),
        ),
      ],
    );
  }
}

//_______________________________DATE SELECTION____________________

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

String onTime = formatedDate(DateTime.now());

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () async {
              final newdata = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now());
              if (newdata == null) return;
              setState(
                () {
                  date = newdata;
                },
              );
            },
            child: Row(
              children: [
                const Icon(Icons.calendar_month),
                Text(
                  (date == null)
                      ? onTime
                      : '${date!.year}/${date!.month}/${date!.day}',
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            )),
      ],
    );
  }
}

//______________________________________CUSTOM TILE___________________

class CustomTile extends StatelessWidget {
  // void popupDeletion(BuildContext context,String key) {
  //   showDialog(
  //       context: context,
  //       builder: (ctx) {
  //         return transactionDeletePopup(this.context,deletion_key);
  //       });
  // }
  void popupEdit(BuildContext context) {
    isAdd = false;
    mainData?.field == CategoryField.income ? categoryMod = 0 : categoryMod = 1;
    dropDownValue == null;
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return AddScreen(selectedTransactionData: mainData);
    }));
  }

  final TransactionModel? mainData;
  final String title;
  final String trailing;
  TextStyle? style;
  final String subTitle1;
  final String subTitle2;
  BuildContext? context;
  String? deletionKey;
  void Function()? function;
  CustomTile(
      {required this.title,
      required this.trailing,
      this.style,
      this.function,
      this.context,
      this.deletionKey,
      Key? key,
      required this.subTitle1,
      required this.subTitle2,
      this.mainData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColor;
    Color bgSub = Theme.of(context).primaryColorLight;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      //_____________ SLIDABLE DELETION AND EDIT > UX <_______________________________

      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: popupEdit,
              backgroundColor: brightness != Brightness.light
                  ? defaultPrimaryColor
                  : defaultColorDark,
              foregroundColor: brightness != Brightness.light
                  ? primaryDark
                  : defaultGreyDark,
              icon: Icons.edit,
              label: 'Edit',
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            /** To Do */
            SlidableAction(
              flex: 1,
              onPressed: (context) {
                transactionDeletePopup(context, deletionKey);
              },
              backgroundColor: brightness != Brightness.light
                  ? defaultPrimaryColor
                  : defaultColorDark,
              foregroundColor: brightness != Brightness.light
                  ? primaryDark
                  : defaultGreyDark,
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            color: bg,
            // color: brightness != Brightness.light
            //     ? defaultPrimaryColor
            //     : defaultColorDark,
            child: Row(
              children: <Widget>[
                Container(
                  color: defaultColor,
                  // color: brightness != Brightness.light
                  //     ? defaultColor
                  //     : defaultPrimaryColorDark,
                  width: 60,
                  height: 60,
                  child: const Icon(Icons.currency_rupee, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: ListTitle,
                      ),
                      Wrap(
                        children: [
                          Text(
                            subTitle1,
                            style: TextStyle(
                                color: brightness != Brightness.light
                                    ? primaryBlack
                                    : defaultLightColorDark),
                          ),
                          const Text(
                            ' | ',
                            style: defaultTitle,
                          ),
                          Text(subTitle2,
                              style: TextStyle(
                                  color: brightness != Brightness.light
                                      ? primaryBlack
                                      : defaultLightColorDark)),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(trailing, style: style ?? null)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//__________________POPUP FOR ADD NEW CATEGORY_____________________________

class AddCategoryPopup extends StatefulWidget {
  AddCategoryPopup({popupTitle, Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  State<AddCategoryPopup> createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  @override
  Widget build(BuildContext context) {
    Color bg= Theme.of(context).primaryColor;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      // backgroundColor: brightness != Brightness.light
      //     ? defaultPrimaryColor
      //     : defaultColorDark,
      backgroundColor: bg,
      title: Row(
        children: const [
          decentWidth,
          Icon(Icons.add_box),
          //<<<<<<<<<<<<< TITLE >>>>>>>>>>>>>>
          Text(
            'ADD NEW CATEGORY',
            style: defaultTitle,
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
                    borderSide: BorderSide(
                      color: brightness != Brightness.light
                          ? primaryBlack
                          : defaultGreyDark,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelStyle: const TextStyle(color: primaryBlack),
                ),
              ),
            ),
            Container(
              width: displayWidth(context) * .76,
              height: displayHeight(context) * .070,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: primaryBlack,
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
                          style: defaultTitle,
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
            defaultButton(
              text: 'Done',
              onPressed: () {
                if (widget._formKey.currentState!.validate()) {
                  @override
                  final _categories = CategoryModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: _categoryNameController.text,
                      field: categoryType == 0
                          ? CategoryField.income
                          : CategoryField.expense);
                  CategoryFunctions().insertCategory(_categories);
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
                            style: TextStyle(color: Colors.white),
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

// final _categoryUpdateNameController = TextEditingController();
///_______________________________________________ UPDATE CATEGORY POPUP ______________________________________

class UpdateCategoryPopup extends StatefulWidget {
  final String oldId;
  final CategoryField oldField;
  final String oldName;
  final List<CategoryModel> currentVal;
  UpdateCategoryPopup({
    Key? key,
    required this.oldId,
    required this.oldName,
    required this.oldField,
    required this.currentVal,
  }) : super(key: key);

  final _categoryUpdateNameController = TextEditingController();
  @override
  _UpdateCategoryPopupState createState() => _UpdateCategoryPopupState();
}

class _UpdateCategoryPopupState extends State<UpdateCategoryPopup> {
  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColor;
    widget._categoryUpdateNameController.text = widget.oldName;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      // backgroundColor: brightness != Brightness.light
      //     ? defaultPrimaryColor
      //     : defaultColorDark,
      backgroundColor: bg,
      title: Row(
        children: const [
          decentWidth,
          Icon(Icons.drive_folder_upload_outlined),
          // TITLE
          Text(
            'UPDATE CATEGORY',
            style: defaultTitle,
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
            //<<<<<<<<<< CATEGORY CONTROLLER TEXTFORM FIELD >>>>>>>>>>>>
            TextFormField(
              controller: widget._categoryUpdateNameController,
              decoration: InputDecoration(
                labelText: 'Category name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: brightness != Brightness.light
                          ? primaryBlack
                          : defaultGreyDark),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: brightness != Brightness.light
                        ? primaryBlack
                        : defaultGreyDark,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelStyle: TextStyle(
                    color: brightness != Brightness.light
                        ? primaryBlack
                        : defaultGreyDark),
              ),
            ),
            Container(
              width: displayWidth(context) * .76,
              height: displayHeight(context) * .070,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: primaryBlack,
                ),
              ),
              //______________________________ CATEGORY FIELD SELECTION DROPDOWN____________________________
              child: DropdownButton(
                hint: const Text('Select Field'),
                underline: const SizedBox(),
                alignment: Alignment.centerRight,
                value: dropValue,
                icon: SizedBox(
                  width: displayWidth(context) * .04,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ),
                items: fields.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(
                      width: displayWidth(context) * .55,
                      child: Text(
                        '  ' + items,
                        style: defaultTitle,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  // String newval=widget.currentVal==CategoryFunctions().incomeCategoryListner.value? fields[0]:fields[1];
                  setState(() {
                    dropValue =
                        // newval;
                        //  newval= (widget.oldField == CategoryField.income ||
                        //           value == CategoryField.income|| value==CategoryField.expense||
                        //           widget.currentVal==CategoryFunctions().incomeCategoryListner.value)
                        //       ? fields[0]
                        //       : fields[1];
                        value.toString();

                    if (value == fields[1]) {
                      categoryType = 1;
                    } else {
                      categoryType = 0;
                    }
                  });
                },
              ),
            ),
            // ADD BUTTON
            defaultButton(
              text: 'Done',
              onPressed: () {
                @override
                final _newCategories = CategoryModel(
                    id: widget.oldId,
                    name: widget._categoryUpdateNameController.text,
                    field: categoryType == 0
                        ? CategoryField.income
                        : CategoryField.expense);
                CategoryFunctions().updateCategory(_newCategories);
                widget._categoryUpdateNameController.clear();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior
                        .floating, //behavior used to change decoration or change default config
                    margin: EdgeInsets.all(10),
                    backgroundColor: defaultColor,
                    content: Text(
                      'Updated...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

//______________________________ CATEGORY DELETION POPUP SCREEN___________________

Widget deletionPopup(context, value) {
  return SimpleDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    backgroundColor:
        brightness != Brightness.light ? defaultPrimaryColor : defaultColorDark,
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
                child: const Text('Cancel')),
            TextButton(
                onPressed: () async {
                  CategoryFunctions.instance.deleteCategory(value, context);
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
                child: const Text('OK'))
          ],
        )
      ],
    ),
  );
}
//__________________________ TRANSACTION DELETION POPUP SCREEN ______________________________

transactionDeletePopup(BuildContext context, String? key) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        backgroundColor: brightness != Brightness.light
            ? defaultPrimaryColor
            : defaultColorDark,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you really want to delete this\ntransaction'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      navigatorKey?.currentState?.pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      TransactionDbFunctions.instance
                          .deleteTransaction(context, key);
                      //  Navigator.of(context).pop();
                      navigatorKey?.currentState?.pop();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget snackAlert(BuildContext context, String text) {
  return SnackBar(
    width: displayWidth(context) * .4,
    behavior: SnackBarBehavior
        .floating, //behavior used to change decoration or change default config
    margin: const EdgeInsets.all(10),
    backgroundColor: Colors.transparent,
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
//________________________TRANSACTION ADDING SELECTION POPUP___________

class addTransactionPopup extends StatelessWidget {
  addTransactionPopup({Key? key}) : super(key: key);
  int? field;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      alignment: AlignmentGeometry.lerp(
          Alignment.bottomCenter, Alignment.bottomCenter, 100),
      backgroundColor: Colors.transparent,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'ADD TRANSACTION',
            style: TextStyle(color: defaultPrimaryColor),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: defaultColor,
              shadowColor: Colors.transparent,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              isAdd = true;
              categoryMod = 0;
              field = 0;
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => AddScreen(field: field)));
              dropDownValue =
                  null; //TransactionDbFunctions.instance.transactionIncomeListener.value[0].category;
            },
            child: const Text('Income ')),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: defaultColor,
            shadowColor: Colors.transparent,
            shape: const StadiumBorder(),
          ),
          onPressed: () async {
            isAdd = true;
            categoryMod = 1;
            field = 1;
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => AddScreen(field: field)));
            dropDownValue =
                null; //TransactionDbFunctions.instance.transactionIncomeListener.value[0].category;
          },
          child: const Text('Expense'),
        ),
        const SizedBox(
          height: 90,
        )
      ],
    );
  }
}

Widget aboutApp(context) {
  return SimpleDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    backgroundColor: defaultPrimaryColor,
    children: [
      //      defaultContainer(
      //  color: defaultColor,
      //  height: displayHeight(context)*.5,

      //  item:
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //  Container(
          //    child:  Text(aboutAppText,style:TextStyle(color: defaultPrimaryColor,)),
          //  )
        ],
      ),
      //  )
    ],
  );
}

class ThemePopup extends StatelessWidget {
  const ThemePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      children: [
        RadioButton(text: 'Light', selection: currentTheme.lightTheme),
        RadioButton(text: 'Dark', selection: currentTheme.darkTheme),
      ],
    );
  }
}

class RadioButton extends StatelessWidget {
  final String text;
  final currentTheme selection;

  RadioButton({Key? key, required this.text, required this.selection})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeListenable,
        builder: (context, currentTheme newValue, child) {
          return Row(
            children: [
              Consumer<ThemeModel>(
                  builder: (context, ThemeModel themeNotifier, child) {
                return Radio<currentTheme>(
                    value: selection,
                    groupValue: newValue,
                    onChanged: (value) {
                      print(value);
                      if (value == null) {
                        return;
                      }
                      themeListenable.value = value;
                      themeListenable.notifyListeners();
                    if(value==currentTheme.lightTheme){
                      // themeNotifier.isDark
                          // ? 
                          themeNotifier.isDark = false;
                    }else{
                          // :
                           themeNotifier.isDark = true;
                    }
                    });
              }),
              Text(text),
            ],
          );
        });
  }
}
