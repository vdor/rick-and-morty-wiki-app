import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/widgets/hero_grid.dart';
import 'package:rick_and_morty_wiki/widgets/hero_list.dart';

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
          if (_displayListing == DisplayListing.list)
            buildList()
          else
            buildGrid(),
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
    return Expanded(child: HeroList(heroes: widget.heroes));
  }

  Widget buildGrid() {
    return Expanded(child: HeroGrid(heroes: widget.heroes));
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
}
