// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiledata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final int typeId = 4;

  @override
  ProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileModel(
      profileName: fields[0] as String?,
      notify: fields[1] as bool?,
      profilePhoto: fields[2] as String?,
      isLogged: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.profileName)
      ..writeByte(1)
      ..write(obj.notify)
      ..writeByte(2)
      ..write(obj.profilePhoto)
      ..writeByte(3)
      ..write(obj.isLogged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
