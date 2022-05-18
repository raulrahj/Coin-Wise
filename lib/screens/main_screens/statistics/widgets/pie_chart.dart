import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/database/transactions_db.dart';

class PieChart1 extends StatelessWidget {
  final List<CategoryModel> statisticsList;
  const PieChart1({Key? key,required this.statisticsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColor;
    // TransactionDbFunctions.instance.refreshData();

    // return ValueListenableBuilder(
    //     valueListenable: CategoryFunctions.instance.multiAmountCategoryListener,
    //     builder: (context, List<CategoryModel> newListener, child) {
          final list = statisticsList;
          if (list.isEmpty) {
            // throw 'list value is empty';

          }
          final map1 = <String, double>{
            for (CategoryModel e in list)
              e.name.toString(): e.categoryAmount ?? 0
          };

          return Padding(
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
                );
        // });
  }
}
