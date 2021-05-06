import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class EpisodeListItem extends StatelessWidget {
  final String title;
  final String name;
  final String date;
  final ImageProvider image;
  final Object heroTag;
  final GestureTapCallback? onTap;

  const EpisodeListItem({
    required this.title,
    required this.name,
    required this.date,
    required this.image,
    required this.heroTag,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: _buildImage(),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: Theme.of(context)
                        .primaryTextTheme
                        .overline
                        ?.copyWith(color: AppColors.blue),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                  Text(
                    date,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText2
                        ?.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).secondaryHeaderColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final content = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
        ),
      ),
    );
    return Hero(
      tag: heroTag,
      child: content,
      flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) =>
          DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: image,
          ),
        ),
      ),
    );
  }
}
