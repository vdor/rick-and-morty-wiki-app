import 'package:flutter/widgets.dart';

class RickAndMortyTextAnimated extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateRickAndMortyTextAnimated();
  }
}

class _StateRickAndMortyTextAnimated extends State<RickAndMortyTextAnimated>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 400,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset("assets/images/text_rick_pic.png"),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: ScaleTransition(
                scale: _animation,
                child: Image.asset("assets/images/text_and_pic.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset("assets/images/text_morty_pic.png"),
            ),
          ),
        ],
      ),
    );
  }
}
