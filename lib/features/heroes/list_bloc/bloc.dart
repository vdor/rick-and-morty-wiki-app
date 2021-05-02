import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/state.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/hero_repository/base.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/heroes_filter_state_repository/base.dart';

class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  final HeroRepository heroesRepo;
  final HeroesFilterStateRepository filterRepo;

  HeroesBloc({
    required this.heroesRepo,
    required this.filterRepo,
  }) : super(HereoesEmptyState());

  bool get shouldLoadHeroes {
    final bool should = !(state is HeroesLoadedState) ||
        (state is HeroesLoadedState &&
            (state as HeroesLoadedState).loaded == false);
    return should;
  }

  @override
  Stream<HeroesState> mapEventToState(HeroesEvent event) async* {
    if (event is HeroesLoadEvent) {
      final filter = await filterRepo.getFilter();
      final heroes = (await _getHeroes(filter)).toList();
      yield HeroesLoadedState(heroes: heroes, filter: filter, loaded: true);
    }

    if (event is HeroesSetFilterEvent) {
      final filter = event.filter;
      List<HeroInfo> heroes =
          event.autoload ? (await _getHeroes(filter)).toList() : const [];

      yield HeroesLoadedState(
          heroes: heroes, filter: event.filter, loaded: event.autoload);
    }

    yield state;
  }

  Future<Iterable<HeroInfo>> _getHeroes(HeroesFilter filter) async {
    late final List<HeroInfo> heroes;

    if (filter.isEmpty) {
      heroes = (await heroesRepo.getAll()).toList();
    } else {
      heroes = (await heroesRepo.filter(filter)).toList();
    }

    return heroes;
  }
}
