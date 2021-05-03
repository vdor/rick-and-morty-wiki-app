import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';

enum HeroesOrder {
  asc,
  desc,
  none,
}

class HeroesFilter extends Equatable {
  final String? query;
  final List<Sex> sex;
  final List<AliveState> aliveState;
  final HeroesOrder orderBy;

  HeroesFilter({
    this.query,
    this.orderBy = HeroesOrder.none,
    required this.sex,
    required this.aliveState,
  });

  HeroesFilter.create({this.query, this.orderBy = HeroesOrder.none})
      : sex = [],
        aliveState = [];

  HeroesFilter copyWith({
    String? query,
    HeroesOrder? orderBy,
    List<Sex>? sex,
    List<AliveState>? aliveState,
  }) {
    return HeroesFilter(
      query: query ?? this.query,
      orderBy: orderBy ?? this.orderBy,
      sex: sex ?? [...this.sex],
      aliveState: aliveState ?? [...this.aliveState],
    );
  }

  bool get isEmpty =>
      (query?.isEmpty ?? true) &&
      sex.isEmpty &&
      aliveState.isEmpty &&
      orderBy == HeroesOrder.none;

  bool get isNotEmpty => !isEmpty;

  bool get queryOnly =>
      query != null && query!.isNotEmpty && sex.isEmpty && aliveState.isEmpty;

  @override
  List<Object?> get props => [query, sex, aliveState, orderBy];

  bool sexSelected(Sex state) {
    return sex.contains(state);
  }

  void toggleSex(Sex state) async {
    if (sex.contains(state)) {
      sex.remove(state);
    } else {
      sex.add(state);
    }
  }

  bool aliveStateSelected(AliveState state) {
    return aliveState.contains(state);
  }

  void toggleAliveState(AliveState state) async {
    if (aliveState.contains(state)) {
      aliveState.remove(state);
    } else {
      aliveState.add(state);
    }
  }
}
