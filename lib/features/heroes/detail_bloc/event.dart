import 'package:equatable/equatable.dart';

class HeroDetailEvent extends Equatable {
  const HeroDetailEvent();
  @override
  List<Object?> get props => [];
}

class HeroLoadDetailEvent extends HeroDetailEvent {
  final String id;

  const HeroLoadDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}
