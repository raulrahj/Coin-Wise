import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/core/constants/text_styles.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/screens/main_screens/statistics/widgets/list_view.dart';
import 'package:coin_wise/screens/main_screens/statistics/widgets/pie_chart.dart';

class AnalysisView extends StatelessWidget {
  final List<CategoryModel> dataList;
  const AnalysisView({Key? key, required this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataList.isEmpty
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
        : ListView(
            shrinkWrap: true,
            children: [
              PieChart1(statisticsList: dataList),
              StatisticsList(categoryList: dataList)
            ],
          );
  }
}
