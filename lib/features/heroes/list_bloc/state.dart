import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';

class HeroesState extends Equatable {
  const HeroesState();

  @override
  List<Object?> get props => [];
}

class HereoesEmptyState extends HeroesState {}

class HeroesLoadedState extends HeroesState {
  final List<HeroInfo> heroes;
  final HeroesFilter filter;
  final bool loaded;

  const HeroesLoadedState({
    required this.heroes,
    required this.filter,
    required this.loaded,
  });

  @override
  List<Object?> get props => [heroes, filter, loaded];
}
