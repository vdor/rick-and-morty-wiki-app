import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/episode.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/episodes_list.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/header.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/hero_info_item.dart';

final content =
    '''Richard "Rick" Sanchez is one of the two eponymous protagonists from the Adult Swim animated television series Rick and Morty. Created by Justin Roiland and Dan Harmon, Sanchez is a misanthropic alcoholic scientist inspired by Emmett "Doc" Brown from Back to the Future and Mister Fantastic from Marvel Comics.''';

class HeroDetailsPage extends StatelessWidget {
  final HeroInfo hero = HeroInfo(
    id: "1",
    name: "name1",
    kind: "kind",
    isAlive: true,
    sex: "male",
    imageUri: "https://picsum.photos/200/300",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Header(
                onBackTap: () {
                  _goBack(context);
                },
                tag: "name2",
                image: NetworkImage("https://picsum.photos/200/300"),
              ),
              SizedBox(height: 24),
              Text(
                "Rick Sanchez",
                style: Theme.of(context).primaryTextTheme.headline5,
              ),
              SizedBox(height: 4),
              Text(
                hero.isAlive ? "alive" : "dead",
                style: Theme.of(context).primaryTextTheme.caption?.copyWith(
                      color: hero.isAlive ? AppColors.green : AppColors.red,
                    ),
              ),
              const SizedBox(height: 36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  const Expanded(
                    child: const HeroInfoItem(
                      label: "Sex",
                      text: "Male",
                    ),
                  ),
                  const Expanded(
                    child: const HeroInfoItem(
                      label: "Race",
                      text: "Human",
                    ),
                  )
                ],
              ),
              HeroInfoItem(
                label: "Location",
                text: "Earth-137",
                onTap: () {},
              ),
              HeroInfoItem(
                label: "Place",
                text: "Earth",
                onTap: () {},
              ),
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
}
