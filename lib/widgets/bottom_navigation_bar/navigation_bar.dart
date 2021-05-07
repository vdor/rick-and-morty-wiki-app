import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/bloc/state.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/bottom_navigation_bar/navigation_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "bottom_bar",
      child: _buildBar(context),
    );
  }

  Widget _buildBar(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 30,
          color: AppColors.black.withOpacity(0.08),
          offset: Offset(0, -4),
        )
      ]),
      child: Material(
        color: _getBgColor(context),
        child: Container(
          height: 60,
          width: double.infinity,
          child:
              BlocBuilder<RouterBloc, RouterState>(builder: (context, state) {
            final BottomBarItem? itemSelected = _getSelectedItem(state);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationItem.character(
                  active: itemSelected == BottomBarItem.characters,
                  title: "Characters",
                  onTap: () {
                    _navigate(context, BottomBarItem.characters);
                  },
                ),
                NavigationItem.episode(
                  active: itemSelected == BottomBarItem.seasons,
                  title: "Episodes",
                  onTap: () {
                    _navigate(context, BottomBarItem.seasons);
                  },
                ),
                NavigationItem.settings(
                  active: itemSelected == BottomBarItem.settings,
                  title: "Settings",
                  onTap: () {
                    _navigate(context, BottomBarItem.settings);
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Color _getBgColor(BuildContext context) {
    return isDarkMode(context) ? AppColors.primaryColorLight : AppColors.white;
  }

  BottomBarItem _getSelectedItem(RouterState state) {
    return state.currentBarItem;
  }

  _navigate(BuildContext context, BottomBarItem item) {
    BlocProvider.of<RouterBloc>(context).add(RouterSetBarItem(item));
  }
}
