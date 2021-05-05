import 'package:equatable/equatable.dart';

abstract class SeasonsEvent extends Equatable {
  const SeasonsEvent();
}

class LoadSeasonsEvent extends SeasonsEvent {
  @override
  List<Object?> get props => [];
}

class SetSeasonsQueryEvent extends SeasonsEvent {
  final String? query;
  final bool autoload;

  const SetSeasonsQueryEvent({
    required this.query,
    this.autoload = false,
  });

  @override
  List<Object?> get props => [query, autoload];
}
