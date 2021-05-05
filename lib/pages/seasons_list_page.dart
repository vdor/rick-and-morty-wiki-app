import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/state.dart';
import 'package:rick_and_morty_wiki/widgets/bottom_navigation_bar/navigation_bar.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/heroes_list_app_bar.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/not_found_heroes_by_query.dart';
import 'package:rick_and_morty_wiki/widgets/seasons_list/seasons_list.dart';

class SeasonsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSeasonsListPage();
  }
}

class _StateSeasonsListPage extends State<SeasonsListPage> {
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<SeasonsBloc>(context);
    if (bloc.shouldLoadEpisodes) {
      bloc.add(LoadSeasonsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // TODO: create for episodes
      appBar: HeroesListAppBar(),
      bottomNavigationBar: BottomNavBar(),
      body: Material(
        color: Theme.of(context).primaryColor,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<SeasonsBloc, SeasonsState>(
      builder: (context, state) {
        return _buildListOfEpisodes();
      },
    );
  }

  Widget _buildListOfEpisodes() {
    return BlocBuilder<SeasonsBloc, SeasonsState>(builder: (context, state) {
      if (state.seasons.length == 0) {
        // TODO: replace to episdodes widget
        return NotFoundHeroesByQuery();
      }

      return SeasonsList(
        seasons: state.seasons,
      );
    });
  }
}
