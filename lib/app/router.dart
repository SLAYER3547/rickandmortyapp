import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmortyapp/views/app_view.dart';
import 'package:rickandmortyapp/views/characters_view/character_view.dart';
import 'package:rickandmortyapp/views/favourites_view/favourites_view.dart';
import 'package:rickandmortyapp/views/locations_view/locations_view.dart';
import 'package:rickandmortyapp/views/sections_view/sections_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();
  static const String characters = '/';
  static const String favourites = '/favourites';
  static const String locations = '/locations';
  static const String sections = '/sections';
}

final router = GoRouter(
  initialLocation: AppRoutes.characters,
  navigatorKey: _routerKey, routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppView(
            navigationShell: navigationShell,
          ),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: AppRoutes.characters,
            builder: (context, state) => const CharacterView(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: AppRoutes.favourites,
            builder: (context, state) => const FavouritesView(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: AppRoutes.locations,
            builder: (context, state) => const LocationsView(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: AppRoutes.sections,
            builder: (context, state) => const SectionsView(),
          )
        ])
      ])
]);
