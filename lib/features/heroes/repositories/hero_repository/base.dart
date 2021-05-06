import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';

abstract class HeroRepository {
  Future<Iterable<HeroInfo>> getAll();
  Future<Iterable<HeroInfo>> filter(HeroesFilter filter);

  Future<HeroInfoDetailed?> getById(String id);
  Future<Iterable<HeroInfo>> findByEpisodeId(String episodeId);
}
