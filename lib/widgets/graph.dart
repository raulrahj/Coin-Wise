import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/screens/main_screens/home.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartSample3 extends StatelessWidget {
  const PieChartSample3({Key? key}) : super(key: key);

  // final dataMap = <String, double>{
  //   "Flutter": 5004223,
  //   "dart":400,

  // };

  // final colorList = <Color>[
  //   Colors.greenAccent,
  // ];

  @override
  Widget build(BuildContext context) {
    print('pie chart is called');
    Color bg =Theme.of(context).primaryColor;
    TransactionDbFunctions.instance.refreshData();

  
    return 
         ValueListenableBuilder(
           valueListenable:CategoryFunctions.instance.multiAmountCategoryListener ,
           builder: (context,List<CategoryModel> newListener, child) {
  final list =
        CategoryFunctions.instance.multiAmountCategoryListener.value.toList();
    if (list.isEmpty) {
      // throw 'list value is empty';
print('list of pie chart is empty now..');
print(CategoryFunctions.instance.multiAmountCategoryListener.value.toList().length);
print('new Listener length ${newListener.length}');
    }
    final map1 = <String, double>{
      for (CategoryModel e in list) e.name.toString(): e.categoryAmount ?? 0
    };
    print(map1);




             return Container(
              child:
              map1.values.isEmpty ?
               Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(
                        height: displayHeight(context) * .2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.find_in_page,
                            size: 40,
                          ),
                          Text(
                            "No data found !",
                            style: boxTitle,
                          )
                        ],
                      ),
                      const Text('add new transactions for monitering...'),
                    ])
        
        : Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Card(
                    color: bg,
                    // color:brightness!=Brightness.light? primaryLight : defaultColorDark,
                    child: Row(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16,),
                            child: PieChart(
                              dataMap: map1,
                              chartType: ChartType.ring,
                              // //baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                              // colorList: colorList,
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesOutside: true,
                                  showChartValuesInPercentage: true,
                                  decimalPlaces: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
           }
         );
  }
}
