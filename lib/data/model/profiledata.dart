import 'package:hive_flutter/adapters.dart';
part 'profiledata.g.dart';
@HiveType(typeId: 4)
class ProfileModel {
  @HiveField(0)
  final String? profileName;

  @HiveField(1)
  final bool? notify;

  @HiveField(2)
  late String? profilePhoto;

  @HiveField(3)
  final bool? isLogged;

  ProfileModel(
      {this.profileName, this.notify, this.profilePhoto, this.isLogged});
}
