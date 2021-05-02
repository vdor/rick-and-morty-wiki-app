import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterItem extends StatelessWidget {
  final String? title;
  final String hint;
  final GestureTapCallback onTap;

  const FilterItem({
    required this.title,
    required this.hint,
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
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: Theme.of(context).primaryTextTheme.bodyText2,
                  ),
                  SizedBox(height: 4),
                ],
                Text(
                  hint,
                  style: Theme.of(context).primaryTextTheme.caption?.copyWith(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
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
