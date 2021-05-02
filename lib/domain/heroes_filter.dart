import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';

enum HeroesOrder {
  asc,
  desc,
}

class HeroesFilter extends Equatable {
  final String? query;
  final List<Sex> sex;
  final List<AliveState> aliveState;
  final HeroesOrder? orderBy;

  const HeroesFilter({
    this.query,
    this.sex = const [],
    this.aliveState = const [],
    this.orderBy,
  });

  bool get isEmpty =>
      (query?.isEmpty ?? true) && sex.isEmpty && aliveState.isEmpty;

  bool get isNotEmpty => !isEmpty;

  bool get queryOnly =>
      query != null && query!.isNotEmpty && sex.isEmpty && aliveState.isEmpty;

  @override
  List<Object?> get props => [query, sex, aliveState, orderBy];
}
