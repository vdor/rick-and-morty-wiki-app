import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_list_item.dart';

class HeroList extends StatelessWidget {
  final void Function(int index)? selectHandler;
  final List<HeroInfo> heroes;
  final bool hideHeroTag;

  const HeroList({
    required this.heroes,
    this.selectHandler,
    required this.hideHeroTag,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: heroes.length,
      itemBuilder: (context, index) => HeroListItem(
        image: NetworkImage(heroes[index].imageUri),
        isAlive: heroes[index].isAlive,
        name: heroes[index].name,
        kind: heroes[index].kind,
        sex: heroes[index].sex,
        useHero: !hideHeroTag,
        onTap: () {
          if (selectHandler != null) {
            selectHandler!(index);
          }
        },
      ),
    );
  }
}
