import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/screens/main_screens/statistics/widgets/refactered.dart';
import 'package:coin_wise/widgets/common_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Analysis extends StatefulWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  String dropDownVal = fields[0];

  @override
  Widget build(BuildContext context) {
    // CategoryFunctions.instance.categoryAmounts();
    Color bg = Theme.of(context).primaryColorDark;
    // isHome=true;
    // setState(() {
    //   if (dropDownVal.toString() == fields[0]) {
    //     incomeList();
    //   } else if (dropDownVal.toString() == fields[1]) {
    //     CategoryFunctions.instance.availableCategories();
    //     expenseList();
    //   }
    // });

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: showBox(
                color: bg,
                y: displayHeight(context) * 0.05,
                x: displayWidth(context) * 0.05,
                alignment: Alignment.center,
                item: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return DropdownButton(
                      underline: const SizedBox(),
                      alignment: Alignment.centerRight,
                      value: dropDownVal,
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: displayWidth(context) * .6,
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: defaultLightColor,
                          ),
                        ],
                      ),
                      items: fields.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        context.read<CategoryBloc>().add(DropdownOnChange(newValue: value.toString(),changeList: state.dropDownValue==fields[1]? state.expenseCategoryList:state.incomeCategoryList));
                        dropDownVal=state.dropDownValue;
                        // setState(() {
                        //   dropDownVal = value.toString();
                        // });
                      },
                    );
                  },
                ),
              ),
            ),
          ),

          Expanded(
            flex: 9,
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                // context.read<CategoryBloc>().add(CategoryAmounts(
                //     incomeCategories: state.incomeCategoryList,
                //     expenseCategories: state.expenseCategoryList));
                context.read<CategoryBloc>().add(const FilterCategories());
                return AnalysisView(dataList: state.visibleList);
              },
            ),
          ),
          // BlocBuilder<CategoryBloc, CategoryState>(
          //   builder: (context, state) {
          //     return AnalysisView(dataList: state.expenseCategoryAmout);
          //   },
          // )
        ],
      ),
    );
  }
}
