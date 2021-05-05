import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/episodes_filter.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/repository/seasons_repository/base.dart';
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
      final seasons = await seasonsRepository.getAll();
      yield SeasonsState(
        filter: state.filter,
        seasons: seasons.toList(),
        loaded: true,
      );
    }
  }

  bool get shouldLoadEpisodes => !state.loaded;
}
