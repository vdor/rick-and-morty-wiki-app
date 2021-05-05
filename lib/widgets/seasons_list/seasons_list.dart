import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/season.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/state.dart';
import 'package:rick_and_morty_wiki/widgets/seasons_list/episodes_list.dart';

class SeasonsList extends StatelessWidget {
  final List<Season> seasons;

  const SeasonsList({required this.seasons});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeasonsBloc, SeasonsState>(builder: (context, state) {
      return DefaultTabController(
        length: state.seasons.length,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Theme.of(context).accentIconTheme.color,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
              tabs: seasons
                  .map(
                    (s) => Tab(
                      child: Center(
                        child: Text(
                          s.name.toUpperCase(),
                          style: Theme.of(context).primaryTextTheme.bodyText2,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                children: seasons
                    .map(
                      (s) => EpisodesList(
                        episodes: s.episodes,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
