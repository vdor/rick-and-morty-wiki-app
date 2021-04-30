import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';

class HeroesState extends Equatable {
  const HeroesState();

  @override
  List<Object?> get props => [];
}

class HereoesEmptyState extends HeroesState {}

class HeroesLoadedState extends HeroesState {
  final List<HeroInfo> heroes;

  const HeroesLoadedState({required this.heroes});

  @override
  List<Object?> get props => [heroes];
}
