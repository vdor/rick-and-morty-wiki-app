import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/widgets/rick_and_morty_text.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Timer? timer;

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
              Expanded(
                  child: Center(
                child: RickAndMortyTextAnimated(),
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

  @override
  initState() {
    super.initState();
    timer = Timer(Duration(seconds: 1), () {
      _goToWelcomePage(context);
    });
  }

  deactivate() {
    super.deactivate();
    timer?.cancel();
  }

  _goToWelcomePage(BuildContext context) {
    // BlocProvider.of<RouterBloc>(context).add(
    //   RouterSetPathEvent(
    //     [WelcomePageConfig()],
    //   ),
    // );
  }
}
