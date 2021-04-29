import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/widgets/hero_grid_item.dart';

class HeroGrid extends StatelessWidget {
  final List<HeroInfo> heroes;

  const HeroGrid({required this.heroes});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      shrinkWrap: true,
      children: heroes
          .map(
            (h) => HeroGridItem(
              image: NetworkImage(h.imageUri),
              isAlive: h.isAlive,
              name: h.name,
              kind: h.kind,
              sex: h.sex,
            ),
          )
          .toList(),
    );
  }
}
