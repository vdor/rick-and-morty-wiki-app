import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotFoundHeroesByQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Entry.opacity(
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/mortry_middle_fingers.png",
            fit: BoxFit.contain,
          ),
          SizedBox(height: 28),
          Text(
            "A character with this name wasn't found",
            style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
          ),
        ],
      ),
    ));
  }
}
