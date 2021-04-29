import 'package:flutter/material.dart';
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
    );
  }
}
