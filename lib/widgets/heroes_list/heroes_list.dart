import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/state.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_grid_item.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_list_item.dart';

enum DisplayListType {
  list,
  grid,
}

class HeroesList extends StatefulWidget {
  final List<HeroInfo> heroes;
  final String title;
  final bool allowSwitchListType;

  const HeroesList({
    required this.heroes,
    required this.title,
    this.allowSwitchListType = true,
  });

  @override
  State<StatefulWidget> createState() {
    return _StateHeroesList();
  }
}

class _StateHeroesList extends State<HeroesList> {
  DisplayListType displayListing = DisplayListType.list;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            widget.title.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 10,
              letterSpacing: 1.5,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          Opacity(
            opacity: widget.allowSwitchListType ? 1 : 0,
            child: IconButton(
              splashRadius: 20,
              icon: AnimatedCrossFade(
                duration: const Duration(milliseconds: 400),
                firstChild: Icon(Icons.format_list_bulleted_rounded),
                secondChild: Icon(Icons.grid_view),
                crossFadeState: displayListing == DisplayListType.list
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              onPressed: widget.allowSwitchListType ? _toggleDisplayMode : null,
            ),
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

  Widget _buildHeroes() {
    if (displayListing == DisplayListType.list)
      return _buildList(widget.heroes);
    else
      return _buildGrid(widget.heroes);
  }

  Widget _buildList(List<HeroInfo> heroes) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => HeroListItem(
          id: heroes[index].id,
          image: NetworkImage(heroes[index].imageUri),
          aliveState: heroes[index].aliveState,
          name: heroes[index].name,
          kind: heroes[index].kind,
          sex: _sexText(heroes[index].sex),
          useHero: displayListing == DisplayListType.list,
          onTap: () {
            _onSelectHero(index);
          },
          key: Key(heroes[index].id),
        ),
        childCount: heroes.length,
      ),
    );
  }

  Widget _buildGrid(List<HeroInfo> heroes) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => HeroGridItem(
          id: heroes[index].id,
          image: NetworkImage(heroes[index].imageUri),
          aliveState: heroes[index].aliveState,
          name: heroes[index].name,
          kind: heroes[index].kind,
          sex: _sexText(heroes[index].sex),
          useHero: displayListing == DisplayListType.grid,
          onTap: () {
            _onSelectHero(index);
          },
          key: Key(heroes[index].id),
        ),
        childCount: heroes.length,
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  _onSelectHero(int index) {
    final bloc = BlocProvider.of<HeroesBloc>(context);
    if (bloc.state is HeroesLoadedState) {
      BlocProvider.of<RouterBloc>(context).add(
        RouterPushEvent(
          HeroDetailsPageConfig.fromId(
            (bloc.state as HeroesLoadedState).heroes[index].id,
          ),
        ),
      );
    }
  }

  String _sexText(Sex sex) {
    switch (sex) {
      case Sex.female:
        return "Female";
      case Sex.male:
        return "Male";
      case Sex.unknown:
        return "Unknown";
    }
  }
}
