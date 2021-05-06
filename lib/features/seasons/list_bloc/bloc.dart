import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/episodes_filter.dart';
import 'package:rick_and_morty_wiki/domain/season.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/seasons/repository/seasons_repository/base.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/state.dart';

class SeasonsBloc extends Bloc<SeasonsEvent, SeasonsState> {
  final SeasonsRepository seasonsRepository;

  SeasonsBloc({required this.seasonsRepository})
      : super(
          SeasonsState(
            filter: const EpisodesFilter.empty(),
            seasons: [],
            loaded: false,
          ),
        );

  @override
  Stream<SeasonsState> mapEventToState(SeasonsEvent event) async* {
    if (event is LoadSeasonsEvent && state.filter.isEmpty) {
      late List<Season> seasons;
      if (state.filter.query == null) {
        seasons = (await seasonsRepository.getAll()).toList();
      } else {
        seasons =
            (await seasonsRepository.filter(state.filter.query!)).toList();
      }

      yield SeasonsState(
        filter: state.filter,
        seasons: seasons.toList(),
        loaded: true,
      );
    }

    if (event is SetSeasonsQueryEvent) {
      late List<Season> seasons;

      if (event.autoload) {
        if (event.query == null || event.query!.isEmpty) {
          seasons = (await seasonsRepository.getAll()).toList();
        } else {
          seasons = (await seasonsRepository.filter(event.query!)).toList();
        }
      }

      yield SeasonsState(
        filter: state.filter,
        seasons: seasons,
        loaded: event.autoload,
      );
    }
  }

  bool get shouldLoadEpisodes => !state.loaded;
}
