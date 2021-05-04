import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/episodes_filter.dart';
import 'package:rick_and_morty_wiki/domain/season.dart';

class SeasonsState extends Equatable {
  final bool loaded;
  final EpisodesFilter filter;
  final List<Season> seasons;

  const SeasonsState({
    required this.filter,
    required this.seasons,
    required this.loaded,
  });

  @override
  List<Object?> get props => [loaded, filter, seasons];
}
