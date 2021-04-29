import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/widgets/splash/rick_and_morty_text.dart';

class SplashPageMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageMobileState();
  }
}

class _SplashPageMobileState extends State<SplashPageMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/stars_bg.png")),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Center(
                child: RickAndMortyTextAnimated(
                  onFinishAnimation: () {
                    _goToNextPage(context);
                  },
                ),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/rick_and_morty_looking_pic.png")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goToNextPage(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterSetPathEvent(
        [ListHeroesPageConfig()],
      ),
    );
  }
}
