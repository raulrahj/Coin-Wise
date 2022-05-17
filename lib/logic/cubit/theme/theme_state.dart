part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
// bool? change;
 const  factory ThemeState({required bool isDark}) = _ThemeState;
   factory ThemeState.initial() => ThemeState(isDark: false );
}
