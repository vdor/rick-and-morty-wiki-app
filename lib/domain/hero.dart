import 'package:equatable/equatable.dart';

class HeroInfo extends Equatable {
  final String id;
  final String name;
  final String kind;
  final bool isAlive;
  final String sex;
  final String imageUri;

  const HeroInfo({
    required this.id,
    required this.name,
    required this.kind,
    required this.isAlive,
    required this.sex,
    required this.imageUri,
  });

  @override
  List<Object?> get props => [name, kind, isAlive, sex];
}
