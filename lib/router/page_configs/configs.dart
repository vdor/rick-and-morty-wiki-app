import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/pages/heroes_filter_page.dart';
import 'package:rick_and_morty_wiki/pages/heroes_list_page.dart';
import 'package:rick_and_morty_wiki/pages/hero_details_page.dart';
import 'package:rick_and_morty_wiki/pages/seasons_list_page.dart';
import 'package:rick_and_morty_wiki/pages/splash_page.dart';

import 'base.dart';

const welcomePath = '/welcome';
const loginPath = '/login';
const tasksPath = '/tasks';
const taskDetailPath = '/tasks-detail';

const splashPath = '/splash';
const listHeroesPath = '/list-heroes';
const filterHeroesPath = '/filter-heroes';
const heroDetailsPath = '/hero-details/:id';

const listPlacesPath = '/list-places';
const searchPlacesPath = '/search-places';
const filterPlacesPath = '/filter-places';
const placeDetailsPath = '/place-details/:id';

const listEpisodesPath = '/list-seasons';
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
    return ListHeroesPage();
  }
}

class HeroDetailsPageConfig extends PageConfig {
  final String path;

  const HeroDetailsPageConfig({required String key, required this.path})
      : super(key: path);

  HeroDetailsPageConfig.fromId(String id, {String? key})
      : path = HeroDetailsPageConfig.buildPathById(id),
        super(key: key ?? 'HeriDetails-$id');

  static String buildPathById(String id) =>
      heroDetailsPath.replaceAll(":id", id);

  String get id => path.split("/").last;

  @override
  Widget buildContent() {
    return HeroDetailsPage(id);
  }
}

class HeroesFilterPageConfig extends PageConfig {
  const HeroesFilterPageConfig({String key = 'HeroesFilter'}) : super(key: key);
  final String path = filterHeroesPath;

  @override
  Widget buildContent() {
    return HeroesFilterPage();
  }
}

class ListSeasonsPageConfig extends PageConfig {
  const ListSeasonsPageConfig({String key = 'Seasons'}) : super(key: key);
  final String path = listEpisodesPath;

  @override
  Widget buildContent() {
    return SeasonsListPage();
  }
}
