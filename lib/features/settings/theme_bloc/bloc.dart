import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_bloc/state.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_repository/base.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeBaseState> {
  final ThemeRepository repo;

  ThemeBloc({required this.repo}) : super(ThemeBaseState());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is InitThemeEvent) {
      final theme = await repo.getTheme();
      yield ThemeState(theme: theme);
    }

    if (event is SetThemeEvent) {
      yield ThemeState(theme: event.theme);
      await repo.setTheme(event.theme);
    }
  }
}
