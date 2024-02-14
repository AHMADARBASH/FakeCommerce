import 'package:fakecommerce/data/helpers/local_data.dart';

abstract class ThemeState {
  String theme;
  ThemeState({required this.theme});
}

class ThemeInitState extends ThemeState {
  ThemeInitState()
      : super(
            theme: LocalData.getData(key: 'theme') == null
                ? "whiteTheme"
                : LocalData.getData(key: 'theme')!);
}

class ChangeThemeState extends ThemeState {
  ChangeThemeState({required super.theme});
}
