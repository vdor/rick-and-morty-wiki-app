import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/back_btn.dart';

class EpisodeHeader extends StatelessWidget {
  final Object heroTag;
  final ImageProvider? image;
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
          _buildImage(context),
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
            child: Entry.offset(
              yOffset: 100,
              duration: const Duration(milliseconds: 900),
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

  Widget _buildImage(BuildContext context) {
    final content = SizedBox(
      height: headerImageHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          image: image == null
              ? null
              : DecorationImage(
                  image: image!,
                  fit: BoxFit.fitWidth,
                ),
        ),
        child: Entry.opacity(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.black.withOpacity(.4), Colors.transparent],
              ),
            ),
          ),
        ),
      ),
    );
    return Hero(
      tag: heroTag,
      child: content,
      flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) =>
          SizedBox(
        height: headerImageHeight,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: image == null
                ? null
                : DecorationImage(
                    image: image!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
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
