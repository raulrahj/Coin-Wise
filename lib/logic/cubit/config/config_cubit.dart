import 'package:bloc/bloc.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'config_state.dart';
part 'config_cubit.freezed.dart';

class ConfigCubit extends Cubit<ConfigState> {

  ConfigCubit() : super(ConfigState.initial());
    Future<void> addprofileData({required ProfileModel value}) async {
    final profileDB = await Hive.openBox<ProfileModel>('profileDB');
    await profileDB.clear();
    await profileDB.put('profile', value);
    emit(state.copyWith(profile: value));
  }
  void refreshProfile()async{
    final profileDB = await Hive.openBox<ProfileModel>('profileDB');
    emit(state.copyWith(profile: profileDB.values.first));
  }

}
