import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/state.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_filter/app_bar.dart';

class HeroesFilterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroesBloc, HeroesState>(builder: (context, state) {
      final hasFilter = state is HeroesLoadedState && state.filter.isNotEmpty;

      return SimpleAppBar(
        onBack: () {
          _goBack(context);
        },
        right: AnimatedOpacity(
          opacity: hasFilter ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: Material(
            color: Theme.of(context).primaryColorLight,
            child: IconButton(
              splashRadius: 20,
              icon: Image.asset("assets/images/ic_filter_applied.png"),
              onPressed: hasFilter
                  ? () {
                      _clearFilter(context);
                    }
                  : null,
            ),
          ),
        ),
      );
    });
  }

  _clearFilter(BuildContext context) {
    BlocProvider.of<HeroesBloc>(context).add(HeroesResetFilterEvent());
  }

  @override
  Size get preferredSize => Size.fromHeight(100);

  _goBack(BuildContext context) {
    BlocProvider.of<HeroesBloc>(context).add(HeroesLoadEvent());
    BlocProvider.of<RouterBloc>(context).add((RouterPopEvent()));
  }
}
