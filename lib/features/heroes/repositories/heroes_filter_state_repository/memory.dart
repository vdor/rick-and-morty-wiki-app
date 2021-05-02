import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/heroes_filter_state_repository/base.dart';

class HeroesFilterStateRepositoryInMemory extends HeroesFilterStateRepository {
  HeroesFilter _filter = HeroesFilter();

  @override
  Future<HeroesFilter> getFilter() {
    return Future.value(_filter);
  }

  @override
  Future<void> setFilter(HeroesFilter filter) {
    _filter = filter;
    return Future.value();
  }
}
