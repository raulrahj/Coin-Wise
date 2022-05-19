part of 'config_cubit.dart';

@freezed
class ConfigState with _$ConfigState {

  const factory ConfigState({required ProfileModel profile}) = _ConfigState;

   factory ConfigState.initial() => ConfigState(profile: _value);
}
  ProfileModel _value = ProfileModel(
    profilePhoto: null,
    isLogged: false,
    notify: true,
    profileName: 'Guest User');