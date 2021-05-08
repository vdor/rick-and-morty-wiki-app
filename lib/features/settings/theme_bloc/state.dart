import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/theme.dart';

class ThemeBaseState extends Equatable {
  const ThemeBaseState();

  @override
  List<Object?> get props => [];
}

class ThemeState extends ThemeBaseState {
  final DarkTheme theme;

  const ThemeState({required this.theme});

  @override
  List<Object?> get props => [theme];
}
