import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/widgets/back_btn.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/bordered_avatar.dart';
import 'package:rick_and_morty_wiki/widgets/image_blured.dart';

const double avatarRadius = 73;
const double coverImageHeight = 218;
const double containerHeight = coverImageHeight + avatarRadius;

class Header extends StatelessWidget {
  final ImageProvider image;
  final String tag;
  final GestureTapCallback onBackTap;

  const Header({
    required this.image,
    required this.tag,
    required this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: coverImageHeight,
            child: ImageBlured(
              image: image,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: SafeArea(
                child: BackBtn(
                  onTap: onBackTap,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BorderedAvatar(
              tag: tag,
              image: image,
              radius: avatarRadius,
            ),
          ),
        ],
      ),
    );
  }
}
