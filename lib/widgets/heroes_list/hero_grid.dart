import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_grid_item.dart';

class HeroGrid extends StatelessWidget {
  final void Function(int index)? selectHandler;
  final List<HeroInfo> heroes;
  final bool hideHeroTag;

  const HeroGrid({
    required this.heroes,
    required this.hideHeroTag,
    this.selectHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      shrinkWrap: true,
      children: heroes
          .asMap()
          .entries
          .map(
            (e) => HeroGridItem(
              image: NetworkImage(e.value.imageUri),
              isAlive: e.value.isAlive,
              name: e.value.name,
              kind: e.value.kind,
              sex: e.value.sex,
              useHero: !hideHeroTag,
              onTap: () {
                if (selectHandler != null) {
                  selectHandler!(e.key);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
