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
  double borderRadius = 100;
  final TextEditingController _textController = TextEditingController();
  final animationDuration = const Duration(milliseconds: 300);

  @override
  initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        borderRadius = hasText ? 0 : 100;
      });
    });
  }

  bool get hasText => _textController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: SafeArea(
        child: AnimatedPadding(
            duration: animationDuration,
            padding: EdgeInsets.symmetric(
              horizontal: hasText ? 0 : 16,
              vertical: 16,
            ),
            child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedCrossFade(
                        firstChild: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        secondChild: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).accentIconTheme.color,
                        ),
                        crossFadeState: hasText
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: animationDuration,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _textController,
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
                      AnimatedOpacity(
                        opacity: hasText ? 0 : 1,
                        duration: animationDuration,
                        child: SizedBox(
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
                      ),
                      AnimatedOpacity(
                          opacity: hasText ? 0 : 1,
                          duration: animationDuration,
                          child: IconButton(
                            icon: Icon(
                              Icons.filter_alt_outlined,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: hasText
                                ? null
                                : () {
                                    print("go");
                                  },
                          )),
                    ],
                  ),
                ))),
      ),
    );
  }
}
