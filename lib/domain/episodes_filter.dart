import 'package:equatable/equatable.dart';

class EpisodesFilter extends Equatable {
  final String? query;

  const EpisodesFilter({required this.query});

  const EpisodesFilter.empty() : query = null;

  bool get isNotEmpty => query != null && query!.isNotEmpty;

  bool get isEmpty => !isNotEmpty;

  @override
  List<Object?> get props => [query];
}
