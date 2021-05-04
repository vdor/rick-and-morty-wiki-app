import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/state.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/widgets/search_bar.dart';

class HeroesListAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroesBloc, HeroesState>(builder: (_, state) {
      return SearchBar(
        hintText: "Searh a hero",
        onChangeText: (text) {
          _onChangeSearchQuery(context, text);
        },
        goToFilter: () {
          _goToFilter(context);
        },
        filterApplied: _filterApplied(state),
      );
    });
  }

  bool _filterApplied(HeroesState state) {
    return state is HeroesLoadedState &&
        state.filter.isNotEmpty &&
        !state.filter.queryOnly;
  }

  _onChangeSearchQuery(BuildContext context, String value) {
    BlocProvider.of<HeroesBloc>(context).add(
      HeroesSetSearchQueryEvent(
        query: value,
        autoload: true,
      ),
    );
  }

  _goToFilter(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPushEvent(
        HeroesFilterPageConfig(),
      ),
    );
  }
}
