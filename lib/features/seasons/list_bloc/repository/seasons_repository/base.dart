import 'package:rick_and_morty_wiki/domain/season.dart';

abstract class SeasonsRepository {
  Future<Iterable<Season>> getAll();
  Future<Iterable<Season>> filter(String query);
}
