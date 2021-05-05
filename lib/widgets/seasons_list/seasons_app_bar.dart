import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/widgets/search_bar.dart';

class SeasonsAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search a season",
      onChangeText: (t) {
        _changeQuery(context, t);
      },
      hideFilter: true,
    );
  }

  _changeQuery(BuildContext context, String query) {
    final bloc = BlocProvider.of<SeasonsBloc>(context);
    bloc.add(SetSeasonsQueryEvent(query: query, autoload: true));
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
