import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/domain/season.dart';

abstract class SeasonsRepository {
  Future<Iterable<Season>> getAll();
  Future<Iterable<Season>> filter(String query);
  Future<Iterable<Episode>> getEpisodesByIds(List<String> ids);
  Future<Episode?> getEpisodeById(String id);
}
