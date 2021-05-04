import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/episodes_filter.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/state.dart';

class SeasonsBloc extends Bloc<SeasonsEvent, SeasonsState> {
  SeasonsBloc()
      : super(
          SeasonsState(
            filter: const EpisodesFilter.empty(),
            seasons: [],
            loaded: false,
          ),
        );

  @override
  Stream<SeasonsState> mapEventToState(SeasonsEvent event) async* {
    if (event is LoadSeasonsEvent) {}
  }

  bool get shouldLoadEpisodes => !state.loaded;
}
