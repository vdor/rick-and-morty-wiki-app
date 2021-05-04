import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/season.dart';

class SeasonsList extends StatelessWidget {
  final List<Season> seasons;

  const SeasonsList({required this.seasons});

  @override
  Widget build(BuildContext context) {
    return Text("list");
  }
}
