
import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/screens/action_screens/categories/widgets/delete_category.dart';
import 'package:coin_wise/screens/action_screens/categories/widgets/update_category.dart';
import 'package:flutter/material.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({required this.categoryList, this.color, Key? key})
      : super(key: key);
  final List<CategoryModel> categoryList;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder(
    //     valueListenable: category,
    //     builder:
    //         (BuildContext ctx, List<CategoryModel> newListener, Widget? _) {
    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, index) {
        final data = categoryList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: color,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text(
                  data.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 17, color: primaryLight),
                ),
                trailing: PopupMenuButton(
                    tooltip: 'options',
                    color: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    onSelected: (value) {
                      (value == 1)
                          ? showDialog(
                              context: context,
                              builder: (ctx) {
                                return deletionPopup(context, data.id);
                              })
                          : showDialog(
                              context: context,
                              builder: (ctx) {
                                return UpdateCategoryPopup(
                                  currentVal: categoryList,
                                  oldName: data.name,
                                  oldField: data.field,
                                  oldId: data.id,
                                );
                              });
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text(
                            'Delete',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Edit',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          value: 2,
                        )
                      ];
                    }),
              ),
            ),
          ),
        );
      },
    );
    // });
  }
}
