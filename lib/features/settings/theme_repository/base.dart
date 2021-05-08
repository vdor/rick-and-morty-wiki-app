import 'package:rick_and_morty_wiki/domain/theme.dart';

abstract class ThemeRepository {
  Future<DarkTheme> getTheme();
  Future setTheme(DarkTheme theme);
}
