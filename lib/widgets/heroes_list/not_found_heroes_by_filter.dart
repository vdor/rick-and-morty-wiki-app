import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotFoundHeroesByFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Entry.opacity(
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/morty_screaming.png"),
          SizedBox(height: 28),
          Text(
            "Nothing was found",
            style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
          ),
        ],
      ),
    ));
  }
}
