import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/state.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/hero_repository/base.dart';
import 'package:rick_and_morty_wiki/features/seasons/repository/seasons_repository/base.dart';

class HeroDetailBloc extends Bloc<HeroDetailEvent, HeroDetailState> {
  final HeroRepository repo;
  final SeasonsRepository seasonsRepo;

  HeroDetailBloc({required this.repo, required this.seasonsRepo})
      : super(HeroDetailState());

  @override
  Stream<HeroDetailState> mapEventToState(HeroDetailEvent event) async* {
    if (event is HeroLoadDetailEvent) {
      final hero = await repo.getById(event.id);
      if (hero != null) {
        final episodes = await seasonsRepo.getEpisodesByIds(hero.episodeIds);
        yield HeroDetailLoadedState(
          hero: hero,
          episodes: episodes.toList(),
        );
      }
    }
  }
}
