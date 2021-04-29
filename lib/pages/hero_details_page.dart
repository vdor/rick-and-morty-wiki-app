import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/events.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/hero_details/header.dart';

class HeroDetailsPage extends StatelessWidget {
  final HeroInfo hero = HeroInfo(
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
            ],
          )),
    );
  }

  _goBack(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(RouterPopEvent());
  }
}
