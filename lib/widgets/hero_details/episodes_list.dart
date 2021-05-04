import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/widgets/episode_list_item.dart';

class EpisodesList extends StatelessWidget {
  final List<Episode> seasons;

  const EpisodesList({required this.seasons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => EpisodeListItem(
        title: seasons[index].title,
        name: seasons[index].name,
        date: seasons[index].date,
        image: NetworkImage(seasons[index].imageUri),
      ),
      itemCount: seasons.length,
    );
  }
}
