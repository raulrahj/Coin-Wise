// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 2;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      id: fields[0] as String,
      name: fields[1] as String,
      field: fields[2] as CategoryField,
      categoryAmount: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.field)
      ..writeByte(3)
      ..write(obj.categoryAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryFieldAdapter extends TypeAdapter<CategoryField> {
  @override
  final int typeId = 1;

  @override
  CategoryField read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryField.income;
      case 1:
        return CategoryField.expense;
      default:
        return CategoryField.income;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryField obj) {
    switch (obj) {
      case CategoryField.income:
        writer.writeByte(0);
        break;
      case CategoryField.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
