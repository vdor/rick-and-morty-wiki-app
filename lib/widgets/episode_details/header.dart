import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/back_btn.dart';

class EpisodeHeader extends StatelessWidget {
  final Object heroTag;
  final ImageProvider image;
  final GestureTapCallback onBack;
  final double headerImageHeight;

  const EpisodeHeader({
    required this.heroTag,
    required this.image,
    required this.onBack,
    required this.headerImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Hero(
            tag: heroTag,
            child: Image(
              image: image,
              fit: BoxFit.fitWidth,
              height: headerImageHeight,
              width: double.infinity,
            ),
          ),
          _buildBackBtn(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Entry.offset(
              yOffset: 50,
              duration: const Duration(milliseconds: 700),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Entry.scale(
              duration: const Duration(milliseconds: 1500),
              child: ClipOval(
                child: Material(
                    color: AppColors.blue,
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 99,
                        height: 99,
                        child: Center(
                          child: Image.asset("assets/images/ic_play.png"),
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackBtn() {
    return Entry.offset(
      yOffset: 0,
      xOffset: -50,
      duration: const Duration(milliseconds: 700),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 19, top: 19),
          child: BackBtn(onTap: onBack),
        ),
      ),
    );
  }
}
