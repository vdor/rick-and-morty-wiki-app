import 'package:equatable/equatable.dart';

class EpisodeDetailEvent extends Equatable {
  const EpisodeDetailEvent();
  @override
  List<Object?> get props => [];
}

class EpisodeLoadDetailEvent extends EpisodeDetailEvent {
  final String id;

  const EpisodeLoadDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}
