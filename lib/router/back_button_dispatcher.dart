import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/router/router_delegate.dart';

class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  final AppRouterDelegate _routerDelegate;

  AppBackButtonDispatcher(this._routerDelegate);

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
