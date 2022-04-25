import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pandabar/fab-button.view.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/models/category_model.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: PandaBarFabButton(
            colors: const [defaultColor, defaultColor],
            size: 50,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AddCategoryPopup();
                  });
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: defaultColor,
          title: const Text('Categories'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: primaryBlack,
              borderRadius: BorderRadius.circular(15),
            ),
            tabs: const [
              Tab(
                text: 'Income',
              ),
              Tab(
                text: 'Expense',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryBuilder(
              category: CategoryFunctions().incomeCategoryListner,
              color: defaultPrimaryColor,
            ),
            CategoryBuilder(
              category: CategoryFunctions().expenseCategoryListner,
              color: primaryRed,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({required this.category, this.color, Key? key})
      : super(key: key);
  final ValueListenable<List<CategoryModel>> category;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: category,
        builder:
            (BuildContext ctx, List<CategoryModel> newListener, Widget? _) {
          return ListView.builder(
            itemCount: newListener.length,
            itemBuilder: (BuildContext context, index) {
              final data = newListener[index];
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: color,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      title: Text(data.name),
                      trailing: PopupMenuButton(onSelected: (value) {
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
                                    currentVal: newListener,
                                    oldName: data.name,
                                    oldField: data.field,
                                    oldId: data.id,
                                  );
                                });
                      }, itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            child: Text('Delete'),
                            value: 1,
                          ),
                          const PopupMenuItem(
                            child: Text('Edit'),
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
        });
  }
}
