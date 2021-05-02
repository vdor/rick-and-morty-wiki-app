import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroesFilterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  bool get hasFilter => true;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
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
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Text(
                          "Filter",
                          style: Theme.of(context).accentTextTheme.bodyText1,
                        ),
                      ),
                      Spacer(),
                      AnimatedOpacity(
                        opacity: hasFilter ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Material(
                          color: Theme.of(context).primaryColorLight,
                          child: IconButton(
                            splashRadius: 20,
                            icon: Image.asset(
                                "assets/images/ic_filter_applied.png"),
                            onPressed: hasFilter ? () {} : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
