import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class HeroListItem extends StatelessWidget {
  final String id;
  final ImageProvider image;
  final AliveState aliveState;
  final String name;
  final String kind;
  final String sex;
  final GestureTapCallback? onTap;
  final bool useHero;

  const HeroListItem({
    required this.id,
    required this.image,
    required this.aliveState,
    required this.name,
    required this.kind,
    required this.sex,
    this.useHero = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAvatar(),
            SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _aliveText.toUpperCase(),
                  style: Theme.of(context).primaryTextTheme.overline?.copyWith(
                        color: _aliveColor,
                      ),
                ),
                Text(
                  name,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                Text(
                  kind,
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildAvatar() {
    final avatar = CircleAvatar(
      radius: 37,
      backgroundImage: image,
    );
    if (!useHero) {
      return avatar;
    }
    return Hero(
      tag: "$id-list",
      child: avatar,
      flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) =>
          avatar,
    );
  }

  String get _aliveText {
    switch (aliveState) {
      case AliveState.alive:
        return "alive";
      case AliveState.dead:
        return "dead";
      case AliveState.unknown:
        return "unknown";
    }
  }

  Color get _aliveColor {
    switch (aliveState) {
      case AliveState.alive:
        return AppColors.green;
      case AliveState.dead:
        return AppColors.red;
      case AliveState.unknown:
        return AppColors.blue;
    }
  }
}
