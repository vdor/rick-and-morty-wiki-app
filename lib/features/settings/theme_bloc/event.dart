import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/theme.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class InitThemeEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class SetThemeEvent extends ThemeEvent {
  final DarkTheme theme;

  const SetThemeEvent({required this.theme});

  @override
  List<Object?> get props => [theme];
}
