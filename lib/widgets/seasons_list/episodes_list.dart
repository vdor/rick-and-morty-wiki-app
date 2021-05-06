import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/widgets/seasons_list/season_item.dart';

class EpisodesList extends StatelessWidget {
  final List<Episode> episodes;
  final Function(int) onSelect;

  const EpisodesList({required this.episodes, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) => EpisodeListItem(
          heroTag: episodes[index].id,
          title: episodes[index].title,
          name: episodes[index].name,
          date: episodes[index].date,
          image: NetworkImage(episodes[index].imageUri),
          onTap: () {
            onSelect(index);
          }),
    );
  }
}
