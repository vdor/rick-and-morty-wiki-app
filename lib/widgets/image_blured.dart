import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageBlured extends StatelessWidget {
  final ImageProvider? image;

  const ImageBlured({required this.image});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: image == null
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                image: image!,
              ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
