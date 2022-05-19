import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/screens/action_screens/categories/widgets/add_category.dart';
import 'package:coin_wise/screens/action_screens/categories/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(const GetAllCategory());
    context.read<CategoryBloc>().add(const FilterCategories());
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: primaryLight,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AddCategoryPopup();
                  });
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return CategoryBuilder(
                  categoryList: state.incomeCategoryList,
                  color: Theme.of(context).primaryColorDark,
                );
              },
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return CategoryBuilder(
                  categoryList: state.expenseCategoryList,
                  color: Theme.of(context).indicatorColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
