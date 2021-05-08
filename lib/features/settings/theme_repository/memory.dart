import 'package:rick_and_morty_wiki/domain/theme.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_repository/base.dart';

class ThemeRepositoryInMemory extends ThemeRepository {
  DarkTheme _theme = DarkTheme.enabled;

  @override
  Future<DarkTheme> getTheme() {
    return Future.value(_theme);
  }

  @override
  Future setTheme(DarkTheme theme) async {
    _theme = theme;
  }
}
