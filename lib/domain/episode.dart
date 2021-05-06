import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final String id;
  final String title;
  final String name;
  final String date;
  final String imageUri;

  const Episode({
    required this.id,
    required this.title,
    required this.name,
    required this.date,
    required this.imageUri,
  });

  @override
  List<Object?> get props => [id, title, name, date];
}
