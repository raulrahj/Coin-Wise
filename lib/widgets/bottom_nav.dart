
// picImageSelection(context) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Open'),
//           content: SingleChildScrollView(
//             child: ListBody(children: [
//               GestureDetector(
//                 child: Text('Camera'),
//                 onTap: () async {
//                   XFile? img =
//                       await imagePicker.pickImage(source: ImageSource.camera);
//                   image = File(img!.path);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               Padding(padding: EdgeInsets.all(10)),
//               GestureDetector(
//                 child: Text('Gallery'),
//                 onTap: () async {
//                   XFile? img =
//                       await imagePicker.pickImage(source: ImageSource.gallery);
//                   image = File(img!.path);
//                   Navigator.of(context).pop();
//                 },
//               )
//             ]),
//           ),
//         );
//       });
// }
