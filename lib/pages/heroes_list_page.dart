import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Hey there"),
      ),
    );
  }
}
