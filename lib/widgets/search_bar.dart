import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef ChangeTextHandler = void Function(String);

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String hintText;
  final ChangeTextHandler onChangeText;
  final VoidCallback? goToFilter;

  const SearchBar({
    required this.hintText,
    required this.onChangeText,
    this.goToFilter,
  });

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
      widget.onChangeText(_textController.text);
      setState(() {
        borderRadius = hasText ? 0 : 100;
      });
    });
  }

  @override
  dispose() {
    _textController.dispose();
    super.dispose();
  }

  bool get hasText => _textController.text.isNotEmpty;

  _goBack() {
    FocusScope.of(context).unfocus();
    _textController.clear();
  }

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
                        secondChild: ClipOval(
                          child: Material(
                            color: Theme.of(context).primaryColorLight,
                            child: InkWell(
                              onTap: _goBack,
                              child: Icon(
                                Icons.arrow_back,
                                color: Theme.of(context).accentIconTheme.color,
                              ),
                            ),
                          ),
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
                        child: Material(
                          color: Theme.of(context).primaryColorLight,
                          child: IconButton(
                            splashRadius: 20,
                            icon: Icon(
                              Icons.filter_alt_outlined,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: hasText ? null : widget.goToFilter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
