import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/detail_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/hero_repository/memory.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/heroes_filter_state_repository/memory.dart';
import 'package:rick_and_morty_wiki/features/seasons/list_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/back_button_dispatcher.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/bloc/state.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/router/router_delegate.dart';
import 'package:rick_and_morty_wiki/router/router_parser.dart';
import 'package:rick_and_morty_wiki/theme.dart';

void main() {
  runApp(App());
}

final heroFilterRepo = HeroesFilterStateRepositoryInMemory();
final routerBloc = RouterBloc({
  BottomBarItem.characters: [SplashPageConfig().buildPage()],
  BottomBarItem.seasons: [ListSeasonsPageConfig().buildPage()],
});
final heroesBloc = HeroesBloc(
    heroesRepo: HeroInMemoryRepository(), filterRepo: heroFilterRepo);
final heroDetailBloc = HeroDetailBloc(repo: HeroInMemoryRepository());

final seasonsBloc = SeasonsBloc();

class App extends StatelessWidget {
  final routerDelegate = AppRouterDelegate(bloc: routerBloc);
  final routeInformationParser = RouteParser();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RouterBloc>(create: (_) => routerBloc),
          BlocProvider<HeroesBloc>(create: (_) => heroesBloc),
          BlocProvider<HeroDetailBloc>(create: (_) => heroDetailBloc),
          BlocProvider<SeasonsBloc>(create: (_) => seasonsBloc)
        ],
        child: MaterialApp.router(
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.light,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.grey7,
            ),
            primaryColor: AppColors.white,
            primaryColorLight: AppColors.gray6,
            primaryTextTheme: TextTheme(
              bodyText1: TextStyles.bodyText1.copyWith(color: AppColors.grey4),
              bodyText2: TextStyles.bodyText1.copyWith(color: AppColors.black),
              overline: TextStyles.overline,
              subtitle1: TextStyles.subtitle1.copyWith(color: AppColors.black),
              caption: TextStyles.caption.copyWith(color: AppColors.grey3),
              headline5: TextStyles.headline5.copyWith(color: AppColors.black),
              headline6: TextStyles.headline6.copyWith(color: AppColors.black),
            ),
            accentTextTheme: TextTheme(
              bodyText1: TextStyles.bodyText1.copyWith(color: AppColors.grey7),
            ),
            dividerColor: AppColors.grey7,
            iconTheme: IconThemeData(color: AppColors.grey7),
            accentIconTheme: IconThemeData(color: AppColors.black),
            secondaryHeaderColor: AppColors.grey3,
            unselectedWidgetColor: AppColors.grey3,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.grey,
            ),
            primaryColor: AppColors.gray5,
            primaryColorLight: AppColors.primaryColorLight,
            primaryTextTheme: TextTheme(
              bodyText1: TextStyles.bodyText1.copyWith(color: AppColors.grey),
              bodyText2: TextStyles.bodyText1.copyWith(color: AppColors.white),
              overline: TextStyles.overline,
              subtitle1: TextStyles.subtitle1.copyWith(color: AppColors.white),
              caption: TextStyles.caption.copyWith(color: AppColors.grey8),
              headline5: TextStyles.headline5.copyWith(color: AppColors.white),
              headline6: TextStyles.headline6.copyWith(color: AppColors.white),
            ),
            accentTextTheme: TextTheme(
              bodyText1: TextStyles.bodyText1.copyWith(color: AppColors.white),
            ),
            dividerColor: AppColors.grey,
            iconTheme: IconThemeData(color: AppColors.grey),
            accentIconTheme: IconThemeData(color: AppColors.white),
            secondaryHeaderColor: AppColors.grey7,
            unselectedWidgetColor: AppColors.grey7,
          ),
          routeInformationParser: routeInformationParser,
          routerDelegate: routerDelegate,
          backButtonDispatcher: AppBackButtonDispatcher(routerDelegate),
        ),
      ),
    );
  }
}
