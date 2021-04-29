import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_grid_item.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_list_item.dart';
import 'package:rick_and_morty_wiki/widgets/search_bar.dart';

enum DisplayListType {
  list,
  grid,
}

final List<HeroInfo> heroes = [
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
  HeroInfo(
      name: "name6",
      kind: "kind",
      isAlive: false,
      sex: "male",
      imageUri: "https://picsum.photos/200/300?q"),
  HeroInfo(
      name: "name7",
      kind: "kind",
      isAlive: false,
      sex: "male",
      imageUri: "https://picsum.photos/200/300?q"),
  HeroInfo(
      name: "name8",
      kind: "kind",
      isAlive: false,
      sex: "male",
      imageUri: "https://picsum.photos/200/300?q"),
];

class ListHeroesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListHeroesState();
  }
}

class ListHeroesState extends State<ListHeroesPage> {
  DisplayListType displayListing = DisplayListType.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(hintText: "Searh a hero"),
      body: Material(
        color: Theme.of(context).primaryColor,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildTitle(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            if (displayListing == DisplayListType.list)
              _buildList()
            else
              _buildGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Всего персонажей: ${heroes.length}".toUpperCase(),
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 10,
              letterSpacing: 1.5,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          IconButton(
            splashRadius: 20,
            icon: AnimatedCrossFade(
              duration: const Duration(milliseconds: 400),
              firstChild: Icon(Icons.format_list_bulleted_rounded),
              secondChild: Icon(Icons.grid_view),
              crossFadeState: displayListing == DisplayListType.list
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            onPressed: _toggleDisplayMode,
          )
        ],
      ),
    );
  }

  _toggleDisplayMode() {
    setState(() {
      if (displayListing == DisplayListType.list) {
        displayListing = DisplayListType.grid;
      } else {
        displayListing = DisplayListType.list;
      }
    });
  }

  Widget _buildList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => HeroListItem(
          image: NetworkImage(heroes[index].imageUri),
          isAlive: heroes[index].isAlive,
          name: heroes[index].name,
          kind: heroes[index].kind,
          sex: heroes[index].sex,
          useHero: displayListing == DisplayListType.list,
          onTap: () {
            _onSelectHero(index);
          },
        ),
        childCount: heroes.length,
      ),
    );
  }

  Widget _buildGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => HeroGridItem(
          image: NetworkImage(heroes[index].imageUri),
          isAlive: heroes[index].isAlive,
          name: heroes[index].name,
          kind: heroes[index].kind,
          sex: heroes[index].sex,
          useHero: displayListing == DisplayListType.grid,
          onTap: () {
            _onSelectHero(index);
          },
        ),
        childCount: heroes.length,
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  _onSelectHero(int index) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPushEvent(
        HeroDetailsPageConfig(),
      ),
    );
  }
}
