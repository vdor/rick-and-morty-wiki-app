import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final String title;
  final String name;
  final String date;
  final String imageUri;

  const Episode({
    required this.title,
    required this.name,
    required this.date,
    required this.imageUri,
  });

  @override
  List<Object?> get props => [title, name, date];
}
