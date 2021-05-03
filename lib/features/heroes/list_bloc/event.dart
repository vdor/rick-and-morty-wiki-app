import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';

class HeroesEvent extends Equatable {
  const HeroesEvent();

  @override
  List<Object?> get props => [];
}

class HeroesLoadEvent extends HeroesEvent {}

class HeroesSetFilterEvent extends HeroesEvent {
  final HeroesFilter filter;
  final bool autoload;

  const HeroesSetFilterEvent({
    required this.filter,
    this.autoload = false,
  });
}

class HeroesResetFilterEvent extends HeroesEvent {
  final bool autoload;
  const HeroesResetFilterEvent({this.autoload = false});
}

class HeroesToggleAliveFilterEvent extends HeroesEvent {
  final bool autoload;
  final AliveState state;

  const HeroesToggleAliveFilterEvent({
    required this.state,
    this.autoload = false,
  });
}

class HeroesToggleSexEvent extends HeroesEvent {
  final Sex state;
  final bool autoload;

  const HeroesToggleSexEvent({
    required this.state,
    this.autoload = false,
  });
}

class HeroesSetOrderBy extends HeroesEvent {
  final HeroesOrder? orderBy;
  final bool autoload;

  const HeroesSetOrderBy({required this.orderBy, this.autoload = false});
}
