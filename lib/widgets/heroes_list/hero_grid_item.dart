import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class HeroGridItem extends StatelessWidget {
  final ImageProvider image;
  final bool isAlive;
  final String name;
  final String kind;
  final String sex;
  final GestureTapCallback? onTap;
  final bool useHero;

  const HeroGridItem({
    required this.image,
    required this.isAlive,
    required this.name,
    required this.kind,
    required this.sex,
    this.useHero = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      (isAlive ? "alive" : "dead").toUpperCase(),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .overline
                          ?.copyWith(
                            color: isAlive ? AppColors.green : AppColors.red,
                          ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Rick Sanchez",
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Human, Male",
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
      tag: "$name-grid",
      child: avatar,
    );
  }
}