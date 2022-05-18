part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {

  const factory CategoryEvent.getAllCategory() = GetAllCategory;
  const factory CategoryEvent.addCategory({required CategoryModel model}) = AddCategory;
  const factory CategoryEvent.updateCategory({required CategoryModel model}) = UpdateCategory;
  const factory CategoryEvent.deleteCategory({required String keey}) = DeleteCategory;
  const factory CategoryEvent.filterCategory() = FilterCategories;
  const factory CategoryEvent.categoryAmounts({required List<CategoryModel> incomeCategories, required List<CategoryModel> expenseCategories }) = CategoryAmounts;
  const factory CategoryEvent.dropDownOnChange({required String newValue,required List<CategoryModel> changeList}) =DropdownOnChange;
  const factory CategoryEvent.onCategoryDropDownChange({required String newCategoryValue,required bool isIncome,required bool isAdd}) = CategoryDropDownChange;
}