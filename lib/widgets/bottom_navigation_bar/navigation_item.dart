import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class NavigationItem extends StatelessWidget {
  final bool active;
  final String title;
  final ImageProvider image;

  const NavigationItem({
    required this.active,
    required this.title,
    required this.image,
    Key? key,
  }) : super(key: key);

  NavigationItem.character({
    required this.active,
    required this.title,
    Key? key,
  })  : image = AssetImage("assets/images/ic_character.png"),
        super(key: key);

  NavigationItem.episode({
    required this.active,
    required this.title,
    Key? key,
  })  : image = AssetImage("assets/images/ic_episode.png"),
        super(key: key);

  NavigationItem.location({
    required this.active,
    required this.title,
    Key? key,
  })  : image = AssetImage("assets/images/ic_location.png"),
        super(key: key);

  NavigationItem.settings({
    required this.active,
    required this.title,
    Key? key,
  })  : image = AssetImage("assets/images/ic_settings.png"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: image,
              color: color,
            ),
            const SizedBox(height: 3),
            Text(
              "Characters",
              style: Theme.of(context)
                  .primaryTextTheme
                  .caption
                  ?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(BuildContext context) {
    return active ? _getActiveColor(context) : _getInactiveColor(context);
  }

  Color _getActiveColor(BuildContext context) {
    return isDarkMode(context) ? AppColors.green : AppColors.blue;
  }

  Color _getInactiveColor(BuildContext context) {
    return isDarkMode(context) ? AppColors.grey7 : AppColors.grey4;
  }
}
