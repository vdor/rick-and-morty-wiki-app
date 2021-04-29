import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class EpisodeListItem extends StatelessWidget {
  final String title;
  final String name;
  final String date;
  final ImageProvider image;

  const EpisodeListItem({
    required this.title,
    required this.name,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: Theme.of(context)
                        .primaryTextTheme
                        .overline
                        ?.copyWith(color: AppColors.blue),
                  ),
                  Text(name,
                      style: Theme.of(context).primaryTextTheme.subtitle1),
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
              Spacer(),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
      width: 74,
      height: 74,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
