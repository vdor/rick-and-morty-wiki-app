import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_listing.dart';
import 'package:rick_and_morty_wiki/widgets/search_bar.dart';

class ListHeroesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListHeroesState();
  }
}

class ListHeroesState extends State<ListHeroesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: "Find a hero",
      ),
      body: HeroesListing(
        heroes: [
          HeroInfo(
            name: "name1",
            kind: "kind",
            isAlive: true,
            sex: "male",
            imageUri: "https://picsum.photos/200/300",
          ),
          HeroInfo(
              name: "name2",
              kind: "kind",
              isAlive: false,
              sex: "male",
              imageUri: "https://picsum.photos/200/300?q"),
          HeroInfo(
              name: "name3",
              kind: "kind",
              isAlive: false,
              sex: "male",
              imageUri: "https://picsum.photos/200/300?q"),
          HeroInfo(
              name: "name4",
              kind: "kind",
              isAlive: false,
              sex: "male",
              imageUri: "https://picsum.photos/200/300?q"),
          HeroInfo(
              name: "name5",
              kind: "kind",
              isAlive: false,
              sex: "male",
              imageUri: "https://picsum.photos/200/300?q"),
        ],
      ),
    );
  }
}
