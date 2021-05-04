import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/bloc/state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc(Map<BottomBarItem, List<Page>> items)
      : super(RouterState(
            items: items, currentBarItem: BottomBarItem.characters));

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    if (event is RouterPushEvent) {
      yield RouterState(items: {
        ...state.items,
        state.currentBarItem: [...state.pages, event.config.buildPage()],
      }, currentBarItem: state.currentBarItem);
    }

    if (event is RouterSetPathEvent) {
      yield RouterState(items: {
        ...state.items,
        state.currentBarItem: event.configs.map((c) => c.buildPage()).toList(),
      }, currentBarItem: state.currentBarItem);
    }

    if (event is RouterPopEvent) {
      yield RouterState(items: {
        ...state.items,
        state.currentBarItem: [...state.pages]..removeLast(),
      }, currentBarItem: state.currentBarItem);
    }

    if (event is RouterSetBarItem) {
      yield RouterState(items: state.items, currentBarItem: event.item);
    }

    yield state;
  }
}
