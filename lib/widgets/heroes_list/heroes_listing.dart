import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_grid.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_list/hero_list.dart';

enum DisplayListing {
  list,
  grid,
}

class HeroesListing extends StatefulWidget {
  final List<HeroInfo> heroes;
  final DisplayListing displayListing;

  const HeroesListing({
    required this.heroes,
    this.displayListing = DisplayListing.list,
  });

  @override
  State<StatefulWidget> createState() {
    return _StateHeroesListing(displayListing);
  }
}

class _StateHeroesListing extends State<HeroesListing> {
  DisplayListing _displayListing;

  _StateHeroesListing(this._displayListing);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTitle(),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: AnimatedCrossFade(
              firstChild: buildList(),
              secondChild: buildGrid(),
              crossFadeState: _displayListing == DisplayListing.list
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Всего персонажей: 200".toUpperCase(),
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 10,
              letterSpacing: 1.5,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          IconButton(
            splashRadius: 20,
            icon: AnimatedCrossFade(
              duration: const Duration(milliseconds: 400),
              firstChild: Icon(Icons.format_list_bulleted_rounded),
              secondChild: Icon(Icons.grid_view),
              crossFadeState: _displayListing == DisplayListing.list
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            onPressed: _toggleDisplayMode,
          )
        ],
      ),
    );
  }

  Widget buildList() {
    return HeroList(
      heroes: widget.heroes,
      hideHeroTag: _displayListing != DisplayListing.list,
      selectHandler: _onSelectHero,
    );
  }

  Widget buildGrid() {
    return HeroGrid(
      heroes: widget.heroes,
      hideHeroTag: _displayListing != DisplayListing.grid,
      selectHandler: _onSelectHero,
    );
  }

  _toggleDisplayMode() {
    setState(() {
      if (_displayListing == DisplayListing.list) {
        _displayListing = DisplayListing.grid;
      } else {
        _displayListing = DisplayListing.list;
      }
    });
  }

  _onSelectHero(int index) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPushEvent(
        HeroDetailsPageConfig(),
      ),
    );
  }
}
