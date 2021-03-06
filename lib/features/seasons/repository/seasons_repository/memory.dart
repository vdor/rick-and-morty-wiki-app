import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/domain/season.dart';
import 'package:rick_and_morty_wiki/features/seasons/repository/seasons_repository/base.dart';

class SeasonsRepositoryInMemory extends SeasonsRepository {
  final List<Season> _seasons = [
    Season(
      name: "Season 1",
      episodes: [
        Episode(
          id: "s1_e1",
          title: "Episode 1",
          name: "Pilot",
          date: "2 December 2013",
          imageUri:
              "https://static.wikia.nocookie.net/rickandmorty/images/4/4b/S1e1_Rick-and-morty.png/revision/latest/scale-to-width-down/620?cb=20160904220006",
          description:
              "'Pilot' is the first episode of the first season of Rick and Morty. It is the first episode of the series overall. It premiered on December 2, 2013. It was written by Dan Harmon and Justin Roiland, and directed by Justin Roiland.",
        ),
        Episode(
          id: "s1_e2",
          title: "Episode 2",
          name: "Lawnmower Dog",
          date: "2 December 2013",
          imageUri:
              "https://static.wikia.nocookie.net/rickandmorty/images/d/d7/Lawnmower_Dog.png/revision/latest/scale-to-width-down/620?cb=20160906083546",
          description:
              "'Lawnmower Dog' is the second episode of the first season of Rick and Morty. It is the second episode of the series overall. It premiered on December 9, 2013. It was written by Ryan Ridley and directed by John Rice.",
        ),
      ],
    ),
    Season(
      name: "Season 2",
      episodes: [
        Episode(
          id: "s2_e1",
          title: "Episode 1",
          name: "A Rickle in Time",
          date: "July 26, 2015",
          imageUri:
              "https://static.wikia.nocookie.net/rickandmorty/images/2/29/A_Rickle_in_Time.png/revision/latest/scale-to-width-down/620?cb=20160920022627",
          description:
              "'Lawnmower Dog' is the second episode of the first season of Rick and Morty. It is the second episode of the series overall. It premiered on December 9, 2013. It was written by Ryan Ridley and directed by John Rice.",
        ),
        Episode(
            id: "s2_e2",
            title: "Episode 2",
            name: "Mortynight Run",
            date: "August 2, 2015",
            imageUri:
                "https://static.wikia.nocookie.net/rickandmorty/images/e/e0/Mortynight_Run.png/revision/latest/scale-to-width-down/620?cb=20160919065322",
            description:
                "'A Rickle in Time' is the first episode of the second season of Rick and Morty. It is the twelfth episode of the series overall. It premiered on July 26, 2015. It was written by Matt Roller and directed by Wes Archer."),
      ],
    ),
  ];
  @override
  Future<Iterable<Season>> getAll() {
    return Future.value(_seasons);
  }

  @override
  Future<Iterable<Season>> filter(String query) {
    final qLower = query.toLowerCase();
    final seaonsFiltered = _seasons.map((s) {
      return Season(
          name: s.name,
          episodes: s.episodes
              .where((e) => e.name.toLowerCase().contains(qLower))
              .toList());
    }).where((s) => s.episodes.length != 0);
    return Future.value(seaonsFiltered);
  }

  @override
  Future<Iterable<Episode>> getEpisodesByIds(List<String> ids) {
    final episodes = _seasons.expand((season) => season.episodes);
    return Future.value(episodes.where((episode) => ids.contains(episode.id)));
  }

  @override
  Future<Episode?> getEpisodeById(String id) {
    final episodes = _seasons.expand((season) => season.episodes);
    return Future.value(episodes.firstWhere((episode) => id == episode.id));
  }
}
