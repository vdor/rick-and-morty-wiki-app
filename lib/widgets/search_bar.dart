import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String hintText;

  const SearchBar({required this.hintText});

  @override
  State<StatefulWidget> createState() {
    return _StateSearchBar();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _StateSearchBar extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: TextField(
                          autofocus: false,
                          style: Theme.of(context).accentTextTheme.bodyText1,
                          cursorColor:
                              Theme.of(context).textSelectionTheme.cursorColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: widget.hintText,
                            hintStyle:
                                Theme.of(context).primaryTextTheme.bodyText1,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            fillColor: Theme.of(context).primaryColorLight,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      SizedBox(
                        width: 1,
                        height: 44,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          print("go");
                        },
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
