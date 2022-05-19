
// import 'package:coin_wise/core/constants/colors.dart';
// import 'package:coin_wise/core/constants/data.dart';
// import 'package:coin_wise/core/constants/sizes.dart';
// import 'package:coin_wise/database/category_db.dart';
// import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
// import 'package:coin_wise/models/category_model.dart';
// import 'package:coin_wise/screens/action_screens/add_transaction/add_screen.dart';
// import 'package:coin_wise/screens/main_screens/home/home.dart';
// import 'package:coin_wise/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// ///_______________________________________________ UPDATE CATEGORY POPUP ______________________________________

// class UpdateCategoryPopup extends StatefulWidget {
//   final String oldId;
//   final CategoryField oldField;
//   final String oldName;
//   final List<CategoryModel> currentVal;
//   UpdateCategoryPopup({
//     Key? key,
//     required this.oldId,
//     required this.oldName,
//     required this.oldField,
//     required this.currentVal,
//   }) : super(key: key);

//   final _categoryUpdateNameController = TextEditingController();
//   @override
//   _UpdateCategoryPopupState createState() => _UpdateCategoryPopupState();
// }

// class _UpdateCategoryPopupState extends State<UpdateCategoryPopup> {
//   @override
//   Widget build(BuildContext context) {
//     Color bg = Theme.of(context).primaryColor;
//     widget._categoryUpdateNameController.text = widget.oldName;
//     return AlertDialog(
//       backgroundColor: bg,
//       title: Row(
//         children: [
//           decentWidth,
//           const Icon(Icons.drive_folder_upload_outlined),
//           // TITLE
//           Text(' UPDATE CATEGORY',
//               style: Theme.of(context).textTheme.bodyLarge),
//         ],
//       ),
//       content: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//         ),
//         height: displayHeight(context) * .3,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             //<<<<<<<<<< CATEGORY CONTROLLER TEXTFORM FIELD >>>>>>>>>>>>
//             TextFormField(
//               controller: widget._categoryUpdateNameController,
//               decoration: InputDecoration(
//                 labelText: 'Category name',
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       color: brightness != Brightness.light
//                           ? primaryBlack
//                           : defaultGreyDark),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Theme.of(context).iconTheme.color!),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 labelStyle: Theme.of(context)
//                     .textTheme
//                     .titleSmall!
//                     .copyWith(fontSize: 18),
//               ),
//             ),
//             Container(
//               width: displayWidth(context) * .76,
//               height: displayHeight(context) * .070,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Theme.of(context).iconTheme.color!),
//               ),
//               //______________________________ CATEGORY FIELD SELECTION DROPDOWN____________________________
//               child: DropdownButton(
//                 hint: const Text('Select Field'),
//                 underline: const SizedBox(),
//                 alignment: Alignment.centerRight,
//                 value: dropValue,
//                 icon: SizedBox(
//                   width: displayWidth(context) * .04,
//                   child: const Align(
//                     alignment: Alignment.center,
//                     child: Icon(Icons.arrow_drop_down),
//                   ),
//                 ),
//                 items: fields.map((String items) {
//                   return DropdownMenuItem(
//                     value: items,
//                     child: SizedBox(
//                       width: displayWidth(context) * .55,
//                       child: Text(
//                         '  ' + items,
//                         style: Theme.of(context).textTheme.bodyText1,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     dropValue = value.toString();

//                     if (value == fields[1]) {
//                       categoryType = 1;
//                     } else {
//                       categoryType = 0;
//                     }
//                   });
//                 },
//               ),
//             ),
//             // ADD BUTTON
//             defaultButton(
//               text: 'Done',
//               onPressed: () {
//                 @override
//                 final _newCategories = CategoryModel(
//                     id: widget.oldId,
//                     name: widget._categoryUpdateNameController.text,
//                     field: categoryType == 0
//                         ? CategoryField.income
//                         : CategoryField.expense);
//                         context.read<CategoryBloc>().add(UpdateCategory(model: _newCategories));
//                 // CategoryFunctions().updateCategory(_newCategories);
//                 widget._categoryUpdateNameController.clear();
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     width: displayWidth(context) * .5,
//                     behavior: SnackBarBehavior.floating,
//                     backgroundColor: defaultColor,
//                     content: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text(
//                           'Updated...',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
