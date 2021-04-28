import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/router/back_button_dispatcher.dart';
import 'package:rick_and_morty_wiki/router/bloc/bloc.dart';
import 'package:rick_and_morty_wiki/router/page_configs/configs.dart';
import 'package:rick_and_morty_wiki/router/router_delegate.dart';
import 'package:rick_and_morty_wiki/router/router_parser.dart';
import 'package:rick_and_morty_wiki/theme.dart';

void main() {
  runApp(App());
}

final routerBloc = RouterBloc(SplashPageConfig());

class App extends StatelessWidget {
  final routerDelegate = AppRouterDelegate(bloc: routerBloc);
  final routeInformationParser = RouteParser();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => routerBloc,
      child: MaterialApp.router(
        theme: ThemeData(primaryColor: AppColors.primaryColor),
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        backButtonDispatcher: AppBackButtonDispatcher(routerDelegate),
      ),
    );
  }
}
