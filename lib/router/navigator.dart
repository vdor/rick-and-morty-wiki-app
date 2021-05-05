import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigator extends StatefulWidget {
  final Key key;
  final PopPageCallback? onPopPage;
  final List<Page<dynamic>> pages;

  const AppNavigator(
      {required this.key, required this.onPopPage, required this.pages})
      : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() {
    return _StateAppNavigator();
  }
}

class _StateAppNavigator extends State<AppNavigator> {
  final controller = MaterialApp.createMaterialHeroController();

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: controller,
      child: Navigator(
        key: widget.key,
        onPopPage: widget.onPopPage,
        pages: widget.pages,
        restorationScopeId: widget.key.toString(),
      ),
    );
  }
}
