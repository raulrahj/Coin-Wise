
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/models/category_model.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';



class PieChartSample3 extends StatelessWidget {
  PieChartSample3({Key? key}) : super(key: key);
  
 

  final dataMap = <String, double>{
    "Flutter": 5004223,
    "dart":400,

  };

  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {

final list= CategoryFunctions.instance.amountCategoryListner.value.toList();  
if(list.isEmpty){
  throw 'list value is empty';
  
}
 final map1 =<String, double> { for (CategoryModel e in list) e.name.toString() : e.categoryAmount??0 };
print(map1);
  return  
       AspectRatio(
      aspectRatio: 1.1,
      child:
      Card(
        color: primaryLight,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child:
Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
           dataMap: map1,
           chartType: ChartType.ring,
          // //baseChartColor: Colors.grey[50]!.withOpacity(0.15),
          // colorList: colorList,
           chartValuesOptions:const ChartValuesOptions(
             showChartValuesInPercentage: true,
             decimalPlaces: 1
           ),
          //totalValue: 20,
        ),
      ),),]))
    );
  }
}