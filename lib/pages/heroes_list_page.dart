import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';

import 'package:rick_and_morty_wiki/features/heroes/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/state.dart';

import 'package:rick_and_morty_wiki/widgets/bottom_navigation_bar/navigation_bar.dart';

import 'package:rick_and_morty_wiki/widgets/heroes_list/heroes_list.dart';
import 'package:rick_and_morty_wiki/widgets/search_bar.dart';

class ListHeroesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateListHeroesPage();
  }
}

class _StateListHeroesPage extends State<ListHeroesPage> {
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<HeroesBloc>(context);
    if (bloc.shouldLoadHeroes) {
      bloc.add(HeroesLoadEvent());
    }
  }

  _onChangeSearchQuery(BuildContext context, String value) {
    BlocProvider.of<HeroesBloc>(context).add(
      HeroesSetFilterEvent(
        filter: HeroesFilter.create(query: value),
        autoload: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: "Searh a hero",
        onChangeText: (text) {
          _onChangeSearchQuery(context, text);
        },
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Material(
        color: Theme.of(context).primaryColor,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<HeroesBloc, HeroesState>(
      builder: (context, state) {
        if (state is HeroesLoadedState && state.filter.queryOnly) {
          return _buildFilteredByQueryHeroes();
        }

        if (state is HeroesLoadedState &&
            state.filter.isNotEmpty &&
            !state.filter.queryOnly) {
          return Text("Filter By properties");
        }

        return _buildListOfHeroes();
      },
    );
  }

  Widget _buildListOfHeroes() {
    return BlocBuilder<HeroesBloc, HeroesState>(builder: (context, state) {
      if (state is HeroesLoadedState) {
        return HeroesList(
          heroes: state.heroes,
          title: "Characters: ${state.heroes.length}",
        );
      }

      return SizedBox.shrink();
    });
  }

  Widget _buildFilteredByQueryHeroes() {
    return BlocBuilder<HeroesBloc, HeroesState>(builder: (context, state) {
      if (state is HeroesLoadedState) {
        return HeroesList(
          heroes: state.heroes,
          title: "Search Results",
          allowSwitchListType: false,
        );
      }

      return SizedBox.shrink();
    });
  }
}
