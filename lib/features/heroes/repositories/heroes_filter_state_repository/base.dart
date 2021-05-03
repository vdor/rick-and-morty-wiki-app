import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';

abstract class HeroesFilterStateRepository {
  Future<HeroesFilter> getFilter();

  Future<void> setFilter(HeroesFilter filter);

  Future toggleAliveState(AliveState state);

  Future toggleSex(Sex sex);
}
