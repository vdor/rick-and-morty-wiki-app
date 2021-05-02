import 'package:equatable/equatable.dart';

enum Sex {
  male,
  female,
  unknown,
}

enum AliveState {
  alive,
  dead,
  unknown,
}

class HeroInfo extends Equatable {
  final String id;
  final String name;
  final String kind;
  final AliveState aliveState;
  final Sex sex;
  final String imageUri;

  const HeroInfo({
    required this.id,
    required this.name,
    required this.kind,
    required this.aliveState,
    required this.sex,
    required this.imageUri,
  });

  @override
  List<Object?> get props => [name, kind, aliveState, sex];
}

class HeroInfoDetailed extends Equatable {
  final HeroInfo heroInfo;
  final String description;
  final String location;
  final String place;

  const HeroInfoDetailed({
    required this.heroInfo,
    required this.description,
    required this.location,
    required this.place,
  });

  @override
  List<Object?> get props => [
        heroInfo,
        description,
        location,
        place,
      ];
}
