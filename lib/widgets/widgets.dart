import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:coin_wise/widgets/list_views.dart';

var dropValue = fields[0];
int? categoryMod;
DateTime? date;

//<<<<<<<<<<<<<< VERTICAL DEVIDER >>>>>>>>>
Widget verticalDivider(context) => Container(
      height: 40,
      width: 3,
      color: Theme.of(context).primaryColorDark,
    );

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
      onPrimary: primaryLight,
      minimumSize: const Size(190, 45),
    ),
  );
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
                Icon(Icons.calendar_month,
                    color: Theme.of(context).iconTheme.color),
                Text(
                  (date == null)
                      ? onTime
                      : '${date!.year}/${date!.month}/${date!.day}',
                  style: TextStyle(
                      fontSize: 13, color: Theme.of(context).iconTheme.color),
                ),
              ],
            )),
      ],
    );
  }
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
