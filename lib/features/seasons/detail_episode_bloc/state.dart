import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';

class EpisodeDetailState extends Equatable {
  const EpisodeDetailState();
  @override
  List<Object?> get props => [];
}

class EpisodeDetailLoadedState extends EpisodeDetailState {
  final Episode episode;
  final List<HeroInfo> characters;

  const EpisodeDetailLoadedState(
      {required this.episode, required this.characters});

  List<Object?> get props => [episode, characters];
}
