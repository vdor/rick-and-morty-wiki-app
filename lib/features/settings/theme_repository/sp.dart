import 'package:rick_and_morty_wiki/domain/theme.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_repository/base.dart';
import 'package:shared_preferences/shared_preferences.dart';

const darkTheme = "DARK_THEME";
const lightTheme = "LIGHT_THEME";
const systemTheme = "SYSTEM_THEME";

class ThemeRepositorySP extends ThemeRepository {
  static const String spKey = "theme";
  @override
  Future<DarkTheme> getTheme() async {
    final sp = await SharedPreferences.getInstance();
    final themeName = sp.getString(spKey);

    switch (themeName) {
      case darkTheme:
        return DarkTheme.enabled;
      case lightTheme:
        return DarkTheme.disabled;
      case systemTheme:
        return DarkTheme.system;
    }

    return DarkTheme.enabled;
  }

  @override
  Future setTheme(DarkTheme theme) async {
    final value = themeToValue(theme);
    final sp = await SharedPreferences.getInstance();
    await sp.setString(spKey, value);
  }

  String themeToValue(DarkTheme theme) {
    switch (theme) {
      case DarkTheme.enabled:
        return darkTheme;
      case DarkTheme.disabled:
        return lightTheme;
      case DarkTheme.system:
        return systemTheme;
    }
  }
}
