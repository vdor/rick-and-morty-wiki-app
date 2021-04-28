import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/widgets/rick_and_morty_text_desktop.dart';

class SplashPageDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageDesktopState();
  }
}

class _SplashPageDesktopState extends State<SplashPageDesktop> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: RickAndMortyTextAnimated(
            onFinishAnimation: () {
              _goToNextPage(context);
            },
          ),
        )),
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
