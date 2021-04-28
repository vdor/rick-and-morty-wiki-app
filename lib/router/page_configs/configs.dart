import 'package:flutter/widgets.dart';

import 'package:rick_and_morty_wiki/pages/splash_page.dart';

import 'base.dart';

const welcomePath = '/welcome';
const loginPath = '/login';
const tasksPath = '/tasks';
const taskDetailPath = '/tasks-detail';

const splashPath = '/splash';
const listHeroesPath = '/list-heroes';
const searchHeroesPath = '/search-heroes';
const filterHeroesPath = '/filter-heroes';
const heroDetailsPath = '/hero-details';

const listPlacesPath = '/list-places';
const searchPlacesPath = '/search-places';
const filterPlacesPath = '/filter-places';
const placeDetailsPath = '/place-details/:id';

const listEpisodesPath = '/list-episodes';
const episodeDetailsPath = '/edpise-details/:id';

const settingsPath = '/settings';

class SplashPageConfig extends PageConfig {
  const SplashPageConfig({String key = 'Splash'}) : super(key: key);
  final String path = splashPath;

  @override
  Widget buildContent() {
    return SplashPage();
  }
}

class ListHeroesPageConfig extends PageConfig {
  const ListHeroesPageConfig({String key = 'ListHeroes'}) : super(key: key);
  final String path = listHeroesPath;

  @override
  Widget buildContent() {
    return SplashPage();
  }
}
