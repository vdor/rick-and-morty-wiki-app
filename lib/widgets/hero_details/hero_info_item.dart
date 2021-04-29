import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroInfoItem extends StatelessWidget {
  final String label;
  final String text;
  final GestureTapCallback? onTap;

  const HeroInfoItem({
    required this.label,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final child = _buildContent(context);

    if (onTap == null) {
      return child;
    }

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
          Column(
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
          if (onTap != null) Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
