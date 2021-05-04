import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty_wiki/features/heroes/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/state.dart';

import 'package:rick_and_morty_wiki/widgets/bottom_navigation_bar/navigation_bar.dart';

import 'package:rick_and_morty_wiki/widgets/heroes_list/heroes_list.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/heroes_list_app_bar.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/not_found_heroes_by_filter.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/not_found_heroes_by_query.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeroesListAppBar(),
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
          return _buildListOfHeroes();
        }

        return _buildListOfHeroes();
      },
    );
  }

  Widget _buildListOfHeroes() {
    return BlocBuilder<HeroesBloc, HeroesState>(builder: (context, state) {
      if (state is HeroesLoadedState) {
        if (state.heroes.length == 0) {
          return NotFoundHeroesByFilter();
        }

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
        if (state.heroes.length == 0) {
          return NotFoundHeroesByQuery();
        }

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
