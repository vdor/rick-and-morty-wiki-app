import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/state.dart';
import 'package:rick_and_morty_wiki/features/heroes/repository/base.dart';

class HeroDetailBloc extends Bloc<HeroDetailEvent, HeroDetailState> {
  final HeroRepository repo;

  HeroDetailBloc({required this.repo}) : super(HeroDetailState());

  @override
  Stream<HeroDetailState> mapEventToState(HeroDetailEvent event) async* {
    if (event is HeroLoadDetailEvent) {
      final hero = await repo.getById(event.id);
      if (hero != null) {
        yield HeroDetailLoadedState(hero: hero);
      }
    }
  }
}
