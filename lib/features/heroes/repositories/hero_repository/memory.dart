import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/hero_repository/base.dart';

const List<HeroInfoDetailed> _heroes = [
  const HeroInfoDetailed(
    heroInfo: const HeroInfo(
      id: "rick",
      name: "Rick Sanchez",
      kind: "Human (Cyborg)",
      aliveState: AliveState.alive,
      sex: Sex.male,
      imageUri:
          "https://static.wikia.nocookie.net/rickandmorty/images/a/a6/Rick_Sanchez.png",
    ),
    description:
        "The titular main protagonist of Rick and Morty. He is a genius scientist whose alcoholism and reckless, nihilistic behavior are a source of concern for his daughter's family, as well as the safety of their son, Morty.",
    location: "Earth (Dimension C-137 - formerly)",
    place: "Earth (Dimension C-137)",
    episodeIds: ['s1_e1', 's1_e2', 's2_e1', 's2_e2'],
  ),
  const HeroInfoDetailed(
    heroInfo: HeroInfo(
      id: "morty",
      name: "Morty Smith",
      kind: "Human",
      aliveState: AliveState.alive,
      sex: Sex.male,
      imageUri:
          "https://static.wikia.nocookie.net/rickandmorty/images/4/41/Morty_Smith.jpg",
    ),
    description:
        "the titular co-protagonist of Rick and Morty. He is the grandson of Rick and is often forced to tag along on his various misadventures. Morty attends Harry Herpson High School along with his sister, Summer.",
    location: "Earth (Dimension C-137)",
    place: "Earth (Dimension C-137)",
    episodeIds: ['s1_e1', 's1_e2', 's2_e1', 's2_e2'],
  ),
  const HeroInfoDetailed(
    heroInfo: const HeroInfo(
      id: "summer",
      name: "Summer Smith",
      kind: "Human",
      aliveState: AliveState.alive,
      sex: Sex.female,
      imageUri:
          "https://static.wikia.nocookie.net/rickandmorty/images/a/ad/Summer_is_cool.jpeg",
    ),
    description: "description",
    location: "Earth (Dimension C-137)",
    place: "Earth (Dimension C-137)",
    episodeIds: ['s1_e1', 's1_e2', 's2_e1'],
  ),
  const HeroInfoDetailed(
    heroInfo: const HeroInfo(
      id: "jerry",
      name: "Jerry Smith",
      kind: "Human",
      aliveState: AliveState.alive,
      sex: Sex.male,
      imageUri:
          "https://static.wikia.nocookie.net/rickandmorty/images/f/f1/Jerry_Smith.png",
    ),
    description:
        "The deuteragonist of Rick and Morty. She is the daughter of Jerry Smith and Beth Smith/Clone Beth, the older sister of Morty Smith, the granddaughter of Leonard Smith, Joyce Smith, Rick Sanchez and Mrs. Sanchez/Diane Sanchez, the great-granddaughter of Rick's Father and a unnamed woman, and the great-niece of the Unnamed Uncle, she currently acts as the older sister and the granddaughter of the Morty and Rick from Dimension C-137. She is the only other member of the the Smith Family to be aware of that fact",
    location: "Earth (Dimension C-137)",
    place: "Earth (Dimension C-137)",
    episodeIds: ['s1_e1', 's1_e2', 's2_e2'],
  ),
  const HeroInfoDetailed(
    heroInfo: const HeroInfo(
      id: "president_morty",
      name: "President Morty",
      kind: "Human, with cybernetic implants",
      aliveState: AliveState.alive,
      sex: Sex.male,
      imageUri:
          "https://static.wikia.nocookie.net/rickandmorty/images/2/23/Evil_Morty_NeverRicking_Morty.jpg",
    ),
    description:
        "President Morty, colloquially known as 'Evil Morty' among fans and the media, as Candidate Morty prior to his election and as Eye Patch Morty, may be one of the main antagonists of Rick and Morty, serving as the main antagonist of Close Rick-Counters of the Rick Kind and The Rickshank Rickdemption, with a cameo appearance as the main antagonist in Never Ricking Morty.",
    location: "Earth (unknown dimension; assumed)",
    place: "Earth (unknown dimension; assumed)",
    episodeIds: ['s2_e2'],
  ),
  const HeroInfoDetailed(
    heroInfo: const HeroInfo(
      id: "meeseeks",
      name: "Mr. Meeseeks",
      kind: "Artificial Humanoids",
      aliveState: AliveState.alive,
      sex: Sex.male,
      imageUri:
          "https://static.wikia.nocookie.net/rickandmorty/images/6/6c/MeeseeksHQ.png",
    ),
    description:
        "Mr. Meeseeks (voiced by Justin Roiland) is the name of all the Meeseeks summoned by activating a Mr. Meeseeks Box. The Meeseeks appear in the fifth episode of the first season, 'Meeseeks and Destroy' as the main antagonists. They are known to inhabit planets across the universe.",
    location: "unknown",
    place: "unknown",
    episodeIds: ['s1_e2'],
  ),
  const HeroInfoDetailed(
    heroInfo: const HeroInfo(
      id: "poopybutthole",
      name: "Mr. Poopybutthole",
      kind: "Mr. Poopybutthole's species",
      aliveState: AliveState.dead,
      sex: Sex.male,
      imageUri:
          "https://static.wikia.nocookie.net/rickandmorty/images/5/52/S2e4_mr_poopybutthole.png",
    ),
    description:
        "Mr. Poopybutthole is a long-time family friend of the Smith Family and a recurring character of the show. He is mostly shown breaking the fourth wall during the show.",
    location: "unknown",
    place: "unknown",
    episodeIds: ['s2_e2'],
  ),
];

class HeroInMemoryRepository extends HeroRepository {
  @override
  Future<Iterable<HeroInfo>> getAll() {
    return Future.value(_heroes.map((h) => h.heroInfo).toList());
  }

  Future<HeroInfoDetailed?> getById(String id) {
    final hero = _heroes.firstWhere((h) => h.heroInfo.id == id);
    return Future.value(hero);
  }

  @override
  Future<Iterable<HeroInfo>> filter(HeroesFilter filter) {
    Iterable<HeroInfoDetailed> heroes = _heroes.where((h) => h.heroInfo.name
        .toLowerCase()
        .contains(filter.query?.toLowerCase() ?? ""));
    List<HeroInfo> result = heroes
        .where((hero) => _matchesFilter(hero, filter))
        .map((e) => e.heroInfo)
        .toList();

    if (filter.orderBy == HeroesOrder.desc) {
      result.sort((a, b) => a.name.compareTo(b.name));
    }

    if (filter.orderBy == HeroesOrder.asc) {
      result.sort((a, b) => a.name.compareTo(b.name) * -1);
    }

    return Future.value(result);
  }

  bool _matchesFilter(HeroInfoDetailed hero, HeroesFilter filter) {
    if (filter.aliveState.isNotEmpty &&
        !filter.aliveState.contains(hero.heroInfo.aliveState)) {
      return false;
    }

    if (filter.sex.isNotEmpty && !filter.sex.contains(hero.heroInfo.sex)) {
      return false;
    }

    if (filter.query != null &&
        !hero.heroInfo.name
            .toLowerCase()
            .contains(filter.query?.toLowerCase() ?? "")) {
      return false;
    }

    return true;
  }

  @override
  Future<Iterable<HeroInfo>> findByEpisodeId(String episodeId) {
    final filtered = _heroes
        .where((hero) => hero.episodeIds.contains(episodeId))
        .map((c) => c.heroInfo);
    return Future.value(filtered);
  }
}
