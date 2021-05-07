import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/router/page_configs/base.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';

class RouteParser extends RouteInformationParser<PageConfig> {
  @override
  Future<PageConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return SplashPageConfig();
    }

    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return SplashPageConfig();
    }

    final path = '/' + uri.pathSegments[0];

    switch (path) {
      case splashPath:
        return SplashPageConfig();
      case listHeroesPath:
        return ListHeroesPageConfig();
      case filterHeroesPath:
        return HeroesFilterPageConfig();
      case listEpisodesPath:
        return ListSeasonsPageConfig();
      case settingsPath:
        return SettingsPageConfig();
    }

    if (path == heroDetailsPath.replaceAll("/id", "")) {
      return HeroDetailsPageConfig(key: path, path: uri.toString());
    }
    if (path == episodeDetailsPath.replaceAll("/id", "")) {
      return EpisodeDetailsPageConfig(key: path, path: uri.toString());
    }
    return SplashPageConfig();
  }

  @override
  RouteInformation restoreRouteInformation(PageConfig configuration) {
    return RouteInformation(location: configuration.path);
  }
}
