import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackBtn extends StatelessWidget {
  final GestureTapCallback onTap;

  const BackBtn({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: ClipOval(
        child: Material(
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).accentIconTheme.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
