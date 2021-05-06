import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/state.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/episodes_list.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/header.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/hero_info_item.dart';

class HeroDetailsPage extends StatefulWidget {
  final String id;
  const HeroDetailsPage(this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateHeroDetailsPage();
  }
}

class _StateHeroDetailsPage extends State<HeroDetailsPage> {
  @override
  void initState() {
    final bloc = BlocProvider.of<HeroDetailBloc>(context);
    final hero = _getHero(bloc.state);

    if (hero == null) {
      bloc.add(HeroLoadDetailEvent(widget.id));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Theme.of(context).primaryColor,
        child: CustomScrollView(
          slivers: [
            _buildHeader(context),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  _buildTitles(context),
                  const SizedBox(height: 24),
                  _buildProperties(context),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(
                    height: 36,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Episodes",
                          style: Theme.of(context).primaryTextTheme.headline6,
                        ),
                        Text(
                          "All episodes",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .caption
                              ?.copyWith(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildEpisodes(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _goBack(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(RouterPopEvent());
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<HeroDetailBloc, HeroDetailState>(
        builder: (context, state) {
      final hero = _getHero(state);
      return SliverAppBar(
        stretch: true,
        automaticallyImplyLeading: false,
        expandedHeight: 250,
        collapsedHeight: 150,
        flexibleSpace: Header(
          onBackTap: () {
            _goBack(context);
          },
          id: widget.id,
          image: hero != null
              ? NetworkImage(
                  (state as HeroDetailLoadedState).hero.heroInfo.imageUri,
                )
              : null,
        ),
      );
    });
  }

  _buildTitles(BuildContext context) {
    return BlocBuilder<HeroDetailBloc, HeroDetailState>(
      builder: (BuildContext context, state) {
        final hero = _getHero(state);

        return Column(
          children: [
            Text(
              hero?.heroInfo.name ?? "",
              style: Theme.of(context).primaryTextTheme.headline4,
            ),
            SizedBox(height: 4),
            Text(
              _aliveText(hero),
              style: Theme.of(context).primaryTextTheme.caption?.copyWith(
                    color: _aliveColor(hero),
                  ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                hero?.description ?? "",
                textAlign: TextAlign.justify,
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProperties(BuildContext context) {
    return BlocBuilder<HeroDetailBloc, HeroDetailState>(
        builder: (context, state) {
      final hero = _getHero(state);

      if (hero == null) {
        return SizedBox.shrink();
      }

      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: HeroInfoItem(
                  label: "Sex",
                  text: _sexText(hero.heroInfo.sex),
                ),
              ),
              Expanded(
                child: HeroInfoItem(
                  label: "Race",
                  text: hero.heroInfo.kind,
                ),
              )
            ],
          ),
          HeroInfoItem(
            label: "Location",
            text: hero.location,
            onTap: () {},
          ),
          HeroInfoItem(
            label: "Place",
            text: hero.place,
            onTap: () {},
          ),
        ],
      );
    });
  }

  Widget _buildEpisodes() {
    return BlocBuilder<HeroDetailBloc, HeroDetailState>(
        builder: (context, state) {
      if (state is! HeroDetailLoadedState) {
        return SizedBox.shrink();
      }
      return EpisodesList(
        seasons: state.episodes,
      );
    });
  }

  HeroInfoDetailed? _getHero(HeroDetailState state) {
    if (state is HeroDetailLoadedState && state.hero.heroInfo.id == widget.id) {
      return state.hero;
    }

    return null;
  }

  String _aliveText(HeroInfoDetailed? hero) {
    if (hero == null) {
      return "";
    }

    switch (hero.heroInfo.aliveState) {
      case AliveState.alive:
        return "alive";
      case AliveState.dead:
        return "dead";
      case AliveState.unknown:
        return "unknown";
    }
  }

  Color? _aliveColor(HeroInfoDetailed? hero) {
    if (hero == null) {
      return null;
    }

    switch (hero.heroInfo.aliveState) {
      case AliveState.alive:
        return AppColors.green;
      case AliveState.dead:
        return AppColors.red;
      case AliveState.unknown:
        return AppColors.blue;
    }
  }

  String _sexText(Sex sex) {
    switch (sex) {
      case Sex.female:
        return "Female";
      case Sex.male:
        return "Male";
      case Sex.unknown:
        return "Unknown";
    }
  }
}
