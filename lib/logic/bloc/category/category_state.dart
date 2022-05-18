part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState(
      {required List<CategoryModel> categoryList,
      required List<CategoryModel> incomeCategoryList,
      required List<CategoryModel> expenseCategoryList,
      required List<CategoryModel> incomeCategoryAmount,
      required List<CategoryModel> expenseCategoryAmout}) = _CategoryState;

  factory CategoryState.initial() => CategoryState(
      categoryList: [],
      incomeCategoryList: [],
      expenseCategoryList: [],
      incomeCategoryAmount: [],
      expenseCategoryAmout: []);
}
