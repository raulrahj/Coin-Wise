import 'package:bloc/bloc.dart';
import 'package:coin_wise/config/app_themes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());
  void themeChange() async {
    ThemePreferences _preferences = ThemePreferences();
 bool change =await _preferences.getTheme();

    emit(state.copyWith(isDark:change));
  }
}
