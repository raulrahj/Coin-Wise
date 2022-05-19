import 'package:flutter/material.dart';
import 'package:coin_wise/data/model/category_model.dart';

class StatisticsList extends StatelessWidget {
  final List<CategoryModel> categoryList;
  const StatisticsList({Key? key, required this.categoryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColor;

    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, index) {
          CategoryModel _data = categoryList[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                  child: categoryList == categoryList
                      ? ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          tileColor: bg,
                          title: Text(_data.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 16,
                                  )),
                          trailing: Text(_data.categoryAmount != null
                              ? '₹ ${_data.categoryAmount.toString()}'
                              : '₹ 0.0'),
                        )
                      : ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          tileColor: Theme.of(context).indicatorColor,
                          title: Text(_data.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 16,
                                  )),
                          trailing: Text(_data.categoryAmount != null
                              ? '₹ ${_data.categoryAmount.toString()}'
                              : '0.0'),
                        )),
            ),
          );
        });
  }
}
