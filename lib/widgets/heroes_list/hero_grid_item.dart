import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class HeroGridItem extends StatelessWidget {
  final String id;
  final ImageProvider image;
  final AliveState aliveState;
  final String name;
  final String kind;
  final String sex;
  final GestureTapCallback? onTap;
  final bool useHero;

  const HeroGridItem({
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
        padding: EdgeInsets.symmetric(horizontal: 38, vertical: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _buildAvatar(),
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _aliveText.toUpperCase(),
                      style:
                          Theme.of(context).primaryTextTheme.overline?.copyWith(
                                color: _aliveColor,
                              ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      kind,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.caption,
                    ),
                  ),
                ],
              )
            ],
          ),
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
      tag: "$id-grid",
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
