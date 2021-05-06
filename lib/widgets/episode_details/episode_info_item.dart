import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EpisodeInfoItem extends StatelessWidget {
  final String label;
  final String text;

  const EpisodeInfoItem({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .caption
                      ?.copyWith(color: Theme.of(context).secondaryHeaderColor),
                ),
                SizedBox(height: 4),
                Text(text, style: Theme.of(context).primaryTextTheme.bodyText2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
