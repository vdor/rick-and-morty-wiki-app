import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/widgets/hero_list_item.dart';

class HeroList extends StatelessWidget {
  final List<HeroInfo> heroes;

  const HeroList({required this.heroes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: heroes.length,
      itemBuilder: (context, index) => HeroListItem(
        image: NetworkImage(heroes[index].imageUri),
        isAlive: heroes[index].isAlive,
        name: heroes[index].name,
        kind: heroes[index].kind,
        sex: heroes[index].sex,
      ),
    );
  }
}
