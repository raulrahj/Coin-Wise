part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState(
      {required List<CategoryModel> categoryList,
      required List<CategoryModel> incomeCategoryList,
      required List<CategoryModel> expenseCategoryList,
      required List<CategoryModel> incomeCategoryAmount,
      required List<CategoryModel> expenseCategoryAmout,
      required List<CategoryModel> visibleList,
      required String dropDownValue,
      required String categoryDropDown,
      required bool isIncome,
      required bool isAdd}) = _CategoryState;

  factory CategoryState.initial() => CategoryState(
      categoryList: [],
      incomeCategoryList: [],
      expenseCategoryList: [],
      incomeCategoryAmount: [],
      expenseCategoryAmout: [],
      visibleList: [],
      dropDownValue: fields[0],
      categoryDropDown: fields[0],
      isIncome: true, isAdd: true);
}
