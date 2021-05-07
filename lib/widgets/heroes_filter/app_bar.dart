import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? right;
  final GestureTapCallback? onBack;
  final String title;
  final bool highlight;

  const SimpleAppBar({
    required this.title,
    required this.highlight,
    this.right,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 24,
            ),
            child: Container(
                height: 48,
                decoration: highlight
                    ? BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                      )
                    : null,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (onBack != null)
                        ClipOval(
                          child: Material(
                            color: Theme.of(context).primaryColorLight,
                            child: InkWell(
                              onTap: onBack,
                              child: SizedBox(
                                width: 48,
                                height: 48,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color:
                                        Theme.of(context).accentIconTheme.color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).accentTextTheme.bodyText1,
                        ),
                      ),
                      const Spacer(),
                      if (right != null) right!,
                    ],
                  ),
                ))),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
