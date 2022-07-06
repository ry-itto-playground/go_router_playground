import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/router.dart';

import 'screens/screens.dart';
import 'router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootRouter = ref.watch(rootRouterProvider);

    return MaterialApp.router(
      routerDelegate: rootRouter.routerDelegate,
      routeInformationParser: rootRouter.routeInformationParser,
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({
    Key? key,
    this.initialTab = AppTab.home,
  }) : super(key: key);

  final AppTab initialTab;

  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  AppTab? currentTab;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        rootRouterProvider.overrideWithValue(GoRouter.of(context)),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text((currentTab ?? widget.initialTab).name)),
        body: GoRouterProviderScope(
          initialLocation: currentTabLocation,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() {
            currentTab = AppTab.values[index];
          }),
          currentIndex: AppTab.values.indexOf(currentTab ?? widget.initialTab),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }

  Widget get currentBody {
    switch (currentTab ?? widget.initialTab) {
      case AppTab.home:
        return const HomeScreen();
      case AppTab.news:
        return const NewsScreen();
      case AppTab.user:
        return const UserScreen();
      default:
        throw UnimplementedError();
    }
  }

  String get currentTabLocation {
    switch (currentTab ?? widget.initialTab) {
      case AppTab.home:
        return HomeRoute().location;
      case AppTab.news:
        return NewsRoute().location;
      case AppTab.user:
        return UserRoute().location;
      default:
        throw UnimplementedError();
    }
  }
}
