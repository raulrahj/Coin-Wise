import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
part 'profiledata.g.dart';

ProfileModel? loginData;
ProfileModel _value = ProfileModel(
    profilePhoto: null,
    isLogged: false,
    profileEmail: null,
    profileName: 'Guest User');
ValueNotifier<ProfileModel> profileListner = ValueNotifier(_value);

class ProflieDb {
  Future<void> addprofileData(ProfileModel _value) async {
    final profileDB = await Hive.openBox<ProfileModel>('profileDB');
    await profileDB.clear();
    await profileDB.put('profile', _value);
  }

  Future<ProfileModel?> getProfileData() async {
    final profileDb = await Hive.openBox<ProfileModel>('profileDB');

    final ProfileModel? _data = await profileDb.get('profile');
    return _data;
  }

  Future<void> refreshProfile() async {
    final profileDb = await Hive.openBox<ProfileModel>('profileDB');
    final ProfileModel? _data = profileDb.get('profile');
    if (_data == null) {
      return;
    }

    profileListner.value = _data;
    profileListner.notifyListeners();
    print(
        'THE PROFILE LISTENER VALUES PRINTING ${profileListner.value.profileName} ${profileListner.value.profileEmail}');
  }
}

@HiveType(typeId: 4)
class ProfileModel {
  @HiveField(0)
  final String? profileName;

  @HiveField(1)
  final String? profileEmail;

  @HiveField(2)
  late String? profilePhoto;

  @HiveField(3)
  final bool? isLogged;

  ProfileModel(
      {this.profileName, this.profileEmail, this.profilePhoto, this.isLogged});
}
