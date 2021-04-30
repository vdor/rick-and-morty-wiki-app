import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';

class HeroDetailState extends Equatable {
  const HeroDetailState();
  @override
  List<Object?> get props => [];
}

class HeroDetailLoadedState extends HeroDetailState {
  final HeroInfoDetailed hero;
  const HeroDetailLoadedState({required this.hero});

  List<Object?> get props => [hero];
}
