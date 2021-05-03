import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/state.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/divider.dart' as divider;
import 'package:rick_and_morty_wiki/widgets/heroes_filter/filter_checkbox_item.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_filter/heroes_filter_app_bar.dart';

class HeroesFilterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHeroesFilterPage();
  }
}

class _StateHeroesFilterPage extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeroesFilterAppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Material(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<HeroesBloc, HeroesState>(builder: (context, state) {
      if (!(state is HeroesLoadedState)) {
        return SizedBox.shrink();
      }

      final filter = state.filter;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 24, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle("SORT BY"),
                SizedBox(height: 24),
                _buildSortSection(),
                divider.Divider(),
                SizedBox(height: 36),
                _buildTitle("STATUS"),
                SizedBox(height: 26),
              ],
            ),
          ),
          FilterCheckboxItem(
            value: filter.aliveStateSelected(AliveState.alive),
            text: "Alive",
            onChanged: (_) {
              _toggleAliveState(AliveState.alive);
            },
          ),
          FilterCheckboxItem(
            value: filter.aliveStateSelected(AliveState.dead),
            text: "Dead",
            onChanged: (_) {
              _toggleAliveState(AliveState.dead);
            },
          ),
          FilterCheckboxItem(
            value: filter.aliveStateSelected(AliveState.unknown),
            text: "Unknown",
            onChanged: (_) {
              _toggleAliveState(AliveState.unknown);
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                divider.Divider(),
                SizedBox(height: 36),
                _buildTitle("SEX"),
                SizedBox(height: 26),
              ],
            ),
          ),
          FilterCheckboxItem(
            value: filter.sexSelected(Sex.male),
            text: "Male",
            onChanged: (_) {
              _toggleSexState(Sex.male);
            },
          ),
          FilterCheckboxItem(
            value: filter.sexSelected(Sex.female),
            text: "Female",
            onChanged: (_) {
              _toggleSexState(Sex.female);
            },
          ),
          FilterCheckboxItem(
            value: filter.sexSelected(Sex.unknown),
            text: "Asexual",
            onChanged: (_) {
              _toggleSexState(Sex.unknown);
            },
          ),
        ],
      );
    });
  }

  Widget _buildSortSection() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<HeroesBloc, HeroesState>(
          builder: (context, state) {
            if (!(state is HeroesLoadedState)) {
              return SizedBox.shrink();
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text("By alphabet")),
                IconButton(
                  onPressed: _setOrderDesc,
                  splashRadius: 20,
                  icon: Image.asset(
                    "assets/images/ic_sort_desc.png",
                    color: state.filter.orderBy == HeroesOrder.desc
                        ? AppColors.blue
                        : Theme.of(context).iconTheme.color,
                  ),
                ),
                SizedBox(width: 30),
                IconButton(
                  onPressed: _setOrderAsc,
                  splashRadius: 20,
                  icon: Image.asset(
                    "assets/images/ic_sort_asc.png",
                    color: state.filter.orderBy == HeroesOrder.asc
                        ? AppColors.blue
                        : Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        letterSpacing: 1.5,
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }

  _setOrderAsc() {
    final bloc = BlocProvider.of<HeroesBloc>(context);
    bloc.add(HeroesSetOrderBy(orderBy: HeroesOrder.asc));
  }

  _setOrderDesc() {
    final bloc = BlocProvider.of<HeroesBloc>(context);
    bloc.add(HeroesSetOrderBy(orderBy: HeroesOrder.desc));
  }

  _toggleAliveState(AliveState state) {
    final bloc = BlocProvider.of<HeroesBloc>(context);
    bloc.add(HeroesToggleAliveFilterEvent(state: state));
  }

  _toggleSexState(Sex state) {
    final bloc = BlocProvider.of<HeroesBloc>(context);
    bloc.add(HeroesToggleSexEvent(state: state));
  }
}
