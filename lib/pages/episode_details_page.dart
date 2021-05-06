import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/episode_details/characters_list.dart';
import 'package:rick_and_morty_wiki/widgets/episode_details/episode_info_item.dart';
import 'package:rick_and_morty_wiki/widgets/episode_details/header.dart';

const headerImageHeight = 248.0;

final description =
    "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.";

class EpisodeDetailsPage extends StatefulWidget {
  final String id;

  const EpisodeDetailsPage(this.id);

  @override
  State<StatefulWidget> createState() {
    return _StateEpisodeDetailsPage();
  }
}

class _StateEpisodeDetailsPage extends State<EpisodeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Theme.of(context).primaryColor,
        child: CustomScrollView(
          slivers: [
            _buildHeader(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      stretch: true,
      collapsedHeight: 100,
      expandedHeight: headerImageHeight,
      automaticallyImplyLeading: false,
      flexibleSpace: EpisodeHeader(
        image: NetworkImage(
            "https://static.wikia.nocookie.net/rickandmorty/images/4/4b/S1e1_Rick-and-morty.png/revision/latest/scale-to-width-down/620?cb=20160904220006"),
        onBack: _goBack,
        heroTag: widget.id,
        headerImageHeight: headerImageHeight,
      ),
    );
  }

  Widget _buildContent() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Text(
                  "М. Найт Шьямал-Инопланетяне",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
                const SizedBox(height: 3),
                Text(
                  "EPISODE 3",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .overline
                      ?.copyWith(color: AppColors.blue),
                ),
                const SizedBox(height: 36),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
                const SizedBox(height: 12),
                const EpisodeInfoItem(
                    label: "Премьера", text: "2 декабря 2013"),
              ],
            ),
          ),
          const SizedBox(height: 23),
          const Divider(),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "Characters",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          const SizedBox(height: 24),
          _buildCharacters(),
        ],
      ),
    );
  }

  Widget _buildCharacters() {
    return CharactersList(
      characters: [],
      onSelect: _goToCharacter,
    );
  }

  _goToCharacter(HeroInfo character) {}

  _goBack() {
    BlocProvider.of<RouterBloc>(context).add(RouterPopEvent());
  }
}
