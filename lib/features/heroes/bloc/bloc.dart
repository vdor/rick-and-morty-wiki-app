import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/bloc/state.dart';
import 'package:rick_and_morty_wiki/features/heroes/repository/base.dart';

class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  final HeroRepository repo;

  HeroesBloc({required this.repo}) : super(HereoesEmptyState());

  @override
  Stream<HeroesState> mapEventToState(HeroesEvent event) async* {
    if (event is HeroesLoadEvent) {
      final List<HeroInfo> heroes = (await repo.getAll()).toList();
      yield HeroesLoadedState(heroes: heroes);
    }
    yield state;
  }
}
