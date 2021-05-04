import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';

class Season extends Equatable {
  final List<Episode> seasons;

  const Season({required this.seasons});

  @override
  List<Object?> get props => [seasons];
}
