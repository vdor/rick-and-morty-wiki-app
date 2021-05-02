import 'package:equatable/equatable.dart';
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
