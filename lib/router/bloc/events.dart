import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_wiki/router/bloc/state.dart';
import 'package:rick_and_morty_wiki/router/page_configs/base.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();

  @override
  List<Object> get props => [];
}

class RouterPushEvent extends RouterEvent {
  final PageConfig config;

  const RouterPushEvent(this.config);

  List<Object> get props => [config];
}

class RouterSetPathEvent extends RouterEvent {
  final List<PageConfig> configs;

  const RouterSetPathEvent(this.configs);

  List<Object> get props => [configs];
}

class RouterPopEvent extends RouterEvent {
  const RouterPopEvent();
}

class RouterSetBarItem extends RouterEvent {
  final BottomBarItem item;

  const RouterSetBarItem(this.item);
}
