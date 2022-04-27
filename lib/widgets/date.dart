// import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/functions.dart';
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';

class MyFormField extends StatefulWidget {
  const MyFormField({Key? key}) : super(key: key);

  // MyFormField({Key? key}) : super(key: key);

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

GlobalKey<FormState> myFormKey = GlobalKey();

class _MyFormFieldState extends State<MyFormField> {
  DateTimeRange? myDateRange;

  void _submitForm() {
    final FormState? form = myFormKey.currentState;
    form!.save();
  }

  @override
  Widget build(BuildContext context) {
    return DateRangeField(
        firstDate: DateTime(2021),
        lastDate: DateTime.now().add(const Duration(days: 1)),
        enabled: true,
        initialValue: DateTimeRange(
            end: DateTime.now().add(const Duration(days: 1)),
            start: DateTime.now().subtract(const Duration(days: 2))),
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: defaultPrimaryColor)),
          labelText: 'Date Range',
          labelStyle: TextStyle(color: defaultPrimaryColor),
          prefixIcon: Icon(
            Icons.date_range,
            color: defaultPrimaryColor,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: defaultPrimaryColor)),
        ),
        validator: (value) {
          if (value!.start.isBefore(DateTime.now())) {
            return 'Please enter a later start date';
          }
          return null;
        },
        onChanged: (value) async {
          setState(() {
            myDateRange = value!;
            final startDate = myDateRange?.start;
            final endDate = myDateRange?.end;
            selectedRangeTransactions(start: startDate, end: endDate);
          });
        });
  }
}
