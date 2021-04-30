import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/state.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/bottom_navigation_bar/navigation_bar.dart';
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
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(context),
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
                              color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const EpisodesList(episodes: [
                Episode(
                    title: "title",
                    name: "name",
                    date: "date",
                    imageUri: "https://picsum.photos/200/300?q"),
                Episode(
                    title: "title",
                    name: "name",
                    date: "date",
                    imageUri: "https://picsum.photos/200/300?q"),
                Episode(
                    title: "title",
                    name: "name",
                    date: "date",
                    imageUri: "https://picsum.photos/200/300?q"),
                Episode(
                    title: "title",
                    name: "name",
                    date: "date",
                    imageUri: "https://picsum.photos/200/300?q"),
                Episode(
                    title: "title",
                    name: "name",
                    date: "date",
                    imageUri: "https://picsum.photos/200/300?q"),
                Episode(
                    title: "title",
                    name: "name",
                    date: "date",
                    imageUri: "https://picsum.photos/200/300?q"),
                Episode(
                    title: "title",
                    name: "name",
                    date: "date",
                    imageUri: "https://picsum.photos/200/300?q"),
              ]),
            ],
          ),
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
      return Header(
        onBackTap: () {
          _goBack(context);
        },
        id: widget.id,
        image: hero != null
            ? NetworkImage(
                (state as HeroDetailLoadedState).hero.heroInfo.imageUri,
              )
            : null,
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
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
            SizedBox(height: 4),
            Text(
              _aliveText(hero),
              style: Theme.of(context).primaryTextTheme.caption?.copyWith(
                    color: hero?.heroInfo.isAlive ?? true
                        ? AppColors.green
                        : AppColors.red,
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
                  text: hero.heroInfo.sex,
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

    return hero.heroInfo.isAlive ? "alive" : "dead";
  }
}
