import 'package:hive_flutter/hive_flutter.dart';
 part 'category_model.g.dart'; 
@HiveType(typeId: 1)
enum CategoryField {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 2)
class CategoryModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final CategoryField field;

  @HiveField(3)
   late double? categoryAmount;

  CategoryModel({required this.id,required this.name,required this.field,this.categoryAmount});
}
