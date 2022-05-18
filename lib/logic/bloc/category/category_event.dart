part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {

  const factory CategoryEvent.getAllCategory() = GetAllCategory;
  const factory CategoryEvent.addCategory({required CategoryModel model}) = AddCategory;
  const factory CategoryEvent.updateCategory({required CategoryModel model}) = UpdateCategory;
  const factory CategoryEvent.deleteCategory({required String keey}) = DeleteCategory;
  const factory CategoryEvent.filterCategory() = FilterCategories;
  const factory CategoryEvent.categoryAmounts({required List<CategoryModel> incomeCategories, required List<CategoryModel> expenseCategories }) = CategoryAmounts;

}