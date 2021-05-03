import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? right;

  const SimpleAppBar({this.right});

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
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Theme.of(context).primaryColorLight,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).accentIconTheme.color,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          "Filter",
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
