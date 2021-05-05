import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/bloc/state.dart';
import 'package:rick_and_morty_wiki/router/navigator.dart';
import 'package:rick_and_morty_wiki/router/page_configs/base.dart';

final bottomItems = [
  BottomBarItem.characters,
  BottomBarItem.seasons,
  BottomBarItem.locations,
  BottomBarItem.settings,
];

class AppRouterDelegate extends RouterDelegate<PageConfig> with ChangeNotifier {
  late final RouterBloc bloc;
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate({required this.bloc}) : navigatorKey = GlobalKey() {
    bloc.stream.listen((state) {
      notifyListeners();
    });
  }

  bool get canPop => bloc.state.pages.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: bloc.state.currentBarItem == BottomBarItem.characters ? 0 : 1,
      children: bottomItems
          .map((item) => Stack(
                children: [
                  Offstage(
                    offstage: item != BottomBarItem.characters,
                    child: AppNavigator(
                      key: Key("chars"),
                      onPopPage: _onPopPage,
                      pages: bloc.state.items[BottomBarItem.characters]!,
                    ),
                  ),
                  Offstage(
                    offstage: item != BottomBarItem.seasons,
                    child: AppNavigator(
                      key: Key("seasons"),
                      onPopPage: _onPopPage,
                      pages: bloc.state.items[BottomBarItem.seasons]!,
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }

  @override
  Future<bool> popRoute() {
    if (canPop) {
      bloc.add(RouterPopEvent());
      return Future.value(true);
    }

    return Future.value(false);
  }

  bool _onPopPage(Route route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop) {
      bloc.add(const RouterPopEvent());
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfig configuration) {
    final shouldSetPath = bloc.state.pages.isEmpty ||
        (bloc.state.pages.last.arguments as PageConfig) != configuration;

    if (shouldSetPath) {
      bloc.add(RouterSetPathEvent([configuration]));
    }

    return SynchronousFuture(null);
  }

  @override
  PageConfig get currentConfiguration =>
      bloc.state.pages.last.arguments as PageConfig;

  List<Page> _buildPages() {
    return List.unmodifiable(bloc.state.pages);
  }
}
