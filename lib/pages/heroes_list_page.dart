import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/bloc/state.dart';
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

class ListHeroesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListHeroesState();
  }
}

class ListHeroesState extends State<ListHeroesPage> {
  DisplayListType displayListing = DisplayListType.list;

  @override
  void initState() {
    final bloc = BlocProvider.of<HeroesBloc>(context);
    if (!(bloc.state is HeroesLoadedState)) {
      bloc.add(HeroesLoadEvent());
    }

    super.initState();
  }

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
            _buildHeroes(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 24),
      child: BlocBuilder<HeroesBloc, HeroesState>(
          builder: (BuildContext context, state) {
        if (state is HeroesLoadedState && state.heroes.isNotEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Всего персонажей: ${state.heroes.length}".toUpperCase(),
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
          );
        }

        return SizedBox.shrink();
      }),
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

  Widget _buildHeroes() {
    return BlocBuilder<HeroesBloc, HeroesState>(builder: (context, state) {
      if (!(state is HeroesLoadedState)) {
        return SliverToBoxAdapter();
      }

      if (displayListing == DisplayListType.list)
        return _buildList(state.heroes);
      else
        return _buildGrid(state.heroes);
    });
  }

  Widget _buildList(List<HeroInfo> heroes) {
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

  Widget _buildGrid(List<HeroInfo> heroes) {
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
