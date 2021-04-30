import 'package:rick_and_morty_wiki/domain/hero.dart';

abstract class HeroRepository {
  Future<Iterable<HeroInfo>> getAll();
}
