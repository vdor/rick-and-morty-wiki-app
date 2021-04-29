import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/widgets/episode_list_item.dart';

class EpisodesList extends StatelessWidget {
  final List<Episode> episodes;

  const EpisodesList({required this.episodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => EpisodeListItem(
        title: episodes[index].title,
        name: episodes[index].name,
        date: episodes[index].date,
        image: NetworkImage(episodes[index].imageUri),
      ),
      itemCount: episodes.length,
    );
  }
}
