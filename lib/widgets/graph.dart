import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/database/transactions_db.dart';

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
    Color bg = Theme.of(context).primaryColor;
    TransactionDbFunctions.instance.refreshData();

    return ValueListenableBuilder(
        valueListenable: CategoryFunctions.instance.multiAmountCategoryListener,
        builder: (context, List<CategoryModel> newListener, child) {
          final list = CategoryFunctions
              .instance.multiAmountCategoryListener.value
              .toList();
          if (list.isEmpty) {
            // throw 'list value is empty';

          }
          final map1 = <String, double>{
            for (CategoryModel e in list)
              e.name.toString(): e.categoryAmount ?? 0
          };

          return Container(
              child: map1.values.isEmpty
                  ? Column(
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: AspectRatio(
                        aspectRatio: 1.2,
                        child: Card(
                          color: bg,
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: PieChart(
                                    dataMap: map1,
                                    chartType: ChartType.ring,
                                    chartValuesOptions:
                                        const ChartValuesOptions(
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
        });
  }
}

 
