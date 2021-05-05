import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum BottomBarItem {
  characters,
  seasons,
  locations,
  settings,
}

class RouterState extends Equatable {
  final Map<BottomBarItem, List<Page>> items;
  final BottomBarItem currentBarItem;

  RouterState({required this.items, required this.currentBarItem});

  List<Page> get pages => items[currentBarItem] ?? [];

  @override
  List<Object> get props => [items, currentBarItem];
}
