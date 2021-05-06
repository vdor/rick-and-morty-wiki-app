import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/widgets/episode_details/character_item.dart';

class CharactersList extends StatelessWidget {
  final List<HeroInfo> characters;
  final Function(HeroInfo) onSelect;

  const CharactersList({required this.characters, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: characters.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final character = characters[index];

          return CharacterItem(
            id: character.id,
            image: NetworkImage(character.imageUri),
            aliveState: character.aliveState,
            name: character.name,
            kind: character.kind,
            onTap: () {
              onSelect(character);
            },
          );
        });
  }
}
