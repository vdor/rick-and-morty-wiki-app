import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/hero_repository/base.dart';
import 'package:rick_and_morty_wiki/features/seasons/detail_episode_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/seasons/detail_episode_bloc/state.dart';
import 'package:rick_and_morty_wiki/features/seasons/repository/seasons_repository/base.dart';

class EpisodeDetailBloc extends Bloc<EpisodeDetailEvent, EpisodeDetailState> {
  final HeroRepository charactersRepo;
  final SeasonsRepository seasonsRepo;

  EpisodeDetailBloc({required this.charactersRepo, required this.seasonsRepo})
      : super(EpisodeDetailState());

  @override
  Stream<EpisodeDetailState> mapEventToState(EpisodeDetailEvent event) async* {
    if (event is EpisodeLoadDetailEvent) {
      final episode = await seasonsRepo.getEpisodeById(event.id);
      if (episode != null) {
        final characters = await charactersRepo.findByEpisodeId(episode.id);
        yield EpisodeDetailLoadedState(
          episode: episode,
          characters: characters.toList(),
        );
      }
    }
  }
}
