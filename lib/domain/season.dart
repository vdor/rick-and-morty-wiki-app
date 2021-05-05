import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';

class Season extends Equatable {
  final String name;
  final List<Episode> episodes;

  const Season({required this.name, required this.episodes});

  @override
  List<Object?> get props => [episodes];
}
