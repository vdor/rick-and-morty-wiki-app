import 'package:equatable/equatable.dart';

abstract class SeasonsEvent extends Equatable {}

class LoadSeasonsEvent extends SeasonsEvent {
  @override
  List<Object?> get props => [];
}
