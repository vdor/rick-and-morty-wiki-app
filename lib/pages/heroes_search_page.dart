import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/widgets/search_bar.dart';

class SearchHeroesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchHeroesState();
  }
}

class SearchHeroesState extends State<SearchHeroesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: "Find a hero",
      ),
    );
  }
}
