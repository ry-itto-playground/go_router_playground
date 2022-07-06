import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/main.dart';
import 'package:go_router_playground/model/news.dart';
import 'package:go_router_playground/screens/news/detail.dart';
import 'package:go_router_playground/screens/screens.dart';

part 'router.g.dart';

final rootRouterProvider = Provider<GoRouter>(
  (_) => GoRouter(
    routes: $appRoutes,
  ),
);
final routerProvider = Provider<GoRouter>((_) => throw UnimplementedError());

enum AppTab {
  home,
  news,
  user,
}

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) {
    return const RootScreen();
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

@TypedGoRoute<NewsRoute>(path: '/news', routes: [
  TypedGoRoute<NewsDetailRoute>(path: ':id'),
])
class NewsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) {
    return const NewsScreen();
  }
}

@TypedGoRoute<UserRoute>(path: '/user')
class UserRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) {
    return const UserScreen();
  }
}

@TypedGoRoute<NewsDetailRoute>(path: '/news/:id')
class NewsDetailRoute extends GoRouteData {
  const NewsDetailRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return NewsDetailScreen(data: newsData[id]);
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Page<void> buildPage(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPage(
            fullscreenDialog: true,
            child: LoginScreen(),
          )
        : MaterialPage(
            fullscreenDialog: true,
            child: LoginScreen(),
          );
  }
}

class GoRouterProviderScope extends StatelessWidget {
  const GoRouterProviderScope({
    super.key,
    required this.initialLocation,
  });
  final String initialLocation;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: $appRoutes,
      initialLocation: initialLocation,
    );
    return ProviderScope(
      overrides: [
        routerProvider.overrideWithValue(router),
      ],
      child: Router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
      ),
    );
  }
}
