import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/seasons/detail_episode_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/seasons/detail_episode_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/seasons/detail_episode_bloc/state.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/episode_details/characters_list.dart';
import 'package:rick_and_morty_wiki/widgets/episode_details/episode_info_item.dart';
import 'package:rick_and_morty_wiki/widgets/episode_details/header.dart';

const headerImageHeight = 248.0;

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
  void initState() {
    super.initState();

    if (!loadedInfo) {
      BlocProvider.of<EpisodeDetailBloc>(context).add(
        EpisodeLoadDetailEvent(widget.id),
      );
    }
  }

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
    return BlocBuilder<EpisodeDetailBloc, EpisodeDetailState>(
        builder: (context, state) {
      ImageProvider? image;

      if (loadedInfo) {
        final uri = (state as EpisodeDetailLoadedState).episode.imageUri;
        image = NetworkImage(uri);
      }

      return SliverAppBar(
        stretch: true,
        collapsedHeight: 100,
        expandedHeight: headerImageHeight,
        automaticallyImplyLeading: false,
        flexibleSpace: EpisodeHeader(
          image: image,
          onBack: _goBack,
          heroTag: widget.id,
          headerImageHeight: headerImageHeight,
        ),
      );
    });
  }

  Widget _buildContent() {
    return SliverToBoxAdapter(
      child: BlocBuilder<EpisodeDetailBloc, EpisodeDetailState>(
          builder: (context, state) {
        if (!loadedInfo) {
          return SizedBox.shrink();
        }

        state = state as EpisodeDetailLoadedState;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    state.episode.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    state.episode.title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .overline
                        ?.copyWith(color: AppColors.blue),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    state.episode.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).primaryTextTheme.bodyText2,
                  ),
                  const SizedBox(height: 12),
                  EpisodeInfoItem(label: "Premiere", text: state.episode.date),
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
            _buildCharacters(state.characters),
          ],
        );
      }),
    );
  }

  Widget _buildCharacters(List<HeroInfo> charcters) {
    return CharactersList(
      characters: charcters,
      onSelect: _goToCharacter,
    );
  }

  _goToCharacter(HeroInfo character) {}

  _goBack() {
    BlocProvider.of<RouterBloc>(context).add(RouterPopEvent());
  }

  bool get loadedInfo {
    final bloc = BlocProvider.of<EpisodeDetailBloc>(context);
    final loaded = bloc.state is EpisodeDetailLoadedState &&
        (bloc.state as EpisodeDetailLoadedState).episode.id == widget.id;
    return loaded;
  }
}
