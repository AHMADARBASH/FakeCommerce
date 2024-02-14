import 'package:fakecommerce/bloc/theme/theme_state.dart';
import 'package:fakecommerce/data/helpers/local_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitState());

  void changeTheme({required String themeName}) {
    LocalData.saveData(key: 'theme', data: themeName);
    emit(ChangeThemeState(theme: themeName));
  }
}
