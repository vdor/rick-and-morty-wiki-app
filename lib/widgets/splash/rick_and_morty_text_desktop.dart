import 'package:flutter/widgets.dart';

class RickAndMortyTextAnimated extends StatefulWidget {
  final Function? onFinishAnimation;

  const RickAndMortyTextAnimated({this.onFinishAnimation});

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
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 150, left: 150, right: 150),
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset("assets/images/rick_and_morty_text.png"),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          widget.onFinishAnimation != null) {
        widget.onFinishAnimation!();
      }
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
