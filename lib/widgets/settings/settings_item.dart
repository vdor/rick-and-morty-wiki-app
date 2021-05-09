import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final GestureTapCallback onTap;

  const SettingsItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final child = _buildContent(context);

    return InkWell(
      onTap: onTap,
      child: child,
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: image,
            width: 27,
            height: 27,
            fit: BoxFit.contain,
            color: Theme.of(context).iconTheme.color,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).primaryTextTheme.bodyText2),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .caption
                      ?.copyWith(color: Theme.of(context).secondaryHeaderColor),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
