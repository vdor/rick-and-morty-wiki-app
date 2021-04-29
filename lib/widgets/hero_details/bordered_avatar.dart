import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BorderedAvatar extends StatelessWidget {
  final ImageProvider image;
  final double radius;
  final String tag;

  const BorderedAvatar({
    required this.image,
    required this.radius,
    this.tag = "BorderedAvatar",
  });

  @override
  Widget build(BuildContext context) {
    final width = radius * 2;
    return SizedBox(
      width: width,
      height: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(width / 2),
          ),
          border: Border.all(width: 8, color: Theme.of(context).primaryColor),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Hero(
                tag: "$tag-grid",
                child: CircleAvatar(
                  backgroundImage: image,
                  radius: radius,
                ),
              ),
              Hero(
                tag: "$tag-list",
                child: CircleAvatar(
                  backgroundImage: image,
                  radius: radius,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
