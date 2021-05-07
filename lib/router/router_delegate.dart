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

  final Map<BottomBarItem, int> bottomItemToIndex = {
    BottomBarItem.characters: 0,
    BottomBarItem.seasons: 1,
    BottomBarItem.settings: 2,
  };

  bool get canPop => bloc.state.pages.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: bottomItemToIndex[bloc.state.currentBarItem],
      children: bottomItems
          .map(
            (item) => AppNavigator(
              key: Key(item.toString()),
              onPopPage: _onPopPage,
              pages: bloc.state.items[item]!,
            ),
          )
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
}
