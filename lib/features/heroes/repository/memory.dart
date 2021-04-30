import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/repository/base.dart';

const List<HeroInfo> _heroes = [
  const HeroInfo(
    id: "rick",
    name: "Rick Sanchez",
    kind: "Human (Cyborg)",
    isAlive: true,
    sex: "Male",
    imageUri:
        "https://static.wikia.nocookie.net/rickandmorty/images/a/a6/Rick_Sanchez.png",
  ),
  const HeroInfo(
    id: "morty",
    name: "Morty Smith",
    kind: "Human",
    isAlive: true,
    sex: "Male",
    imageUri:
        "https://static.wikia.nocookie.net/rickandmorty/images/4/41/Morty_Smith.jpg",
  ),
  const HeroInfo(
    id: "summer",
    name: "Summer Smith",
    kind: "Human",
    isAlive: true,
    sex: "Female",
    imageUri:
        "https://static.wikia.nocookie.net/rickandmorty/images/a/ad/Summer_is_cool.jpeg",
  ),
  const HeroInfo(
    id: "jerry",
    name: "Jerry Smith",
    kind: "Human",
    isAlive: true,
    sex: "Male",
    imageUri:
        "https://static.wikia.nocookie.net/rickandmorty/images/f/f1/Jerry_Smith.png",
  ),
  const HeroInfo(
    id: "president_morty",
    name: "President Morty",
    kind: "Human, with cybernetic implants",
    isAlive: true,
    sex: "Male",
    imageUri:
        "https://static.wikia.nocookie.net/rickandmorty/images/2/23/Evil_Morty_NeverRicking_Morty.jpg",
  ),
  const HeroInfo(
    id: "meeseeks",
    name: "Mr. Meeseeks",
    kind: "Artificial Humanoids",
    isAlive: true,
    sex: "Extant (regularly dying)",
    imageUri:
        "https://static.wikia.nocookie.net/rickandmorty/images/6/6c/MeeseeksHQ.png",
  ),
  const HeroInfo(
    id: "poopybutthole",
    name: "Mr. Poopybutthole",
    kind: "Mr. Poopybutthole's species",
    isAlive: true,
    sex: "Extant (regularly dying)",
    imageUri:
        "https://static.wikia.nocookie.net/rickandmorty/images/5/52/S2e4_mr_poopybutthole.png",
  ),
];

class HeroInMemoryRepository extends HeroRepository {
  @override
  Future<Iterable<HeroInfo>> getAll() {
    return Future.value(_heroes);
  }
}
