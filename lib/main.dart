import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'model/news.dart';
import 'screens/news/detail.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RootScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) {
        return const NewsScreen();
      },
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = int.parse(state.params['id']!);
            final data = newsData.firstWhere((n) => n.id == id);
            return NewsDetailScreen(
              data: data,
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) {
        return const UserScreen();
      },
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) {
        if (defaultTargetPlatform == TargetPlatform.iOS) {
          return CupertinoPage(
            fullscreenDialog: true,
            child: LoginScreen(),
          );
        } else {
          return MaterialPage(
            fullscreenDialog: true,
            child: LoginScreen(),
          );
        }
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          NewsScreen(),
          UserScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        currentIndex: currentIndex,
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
    );
  }
}
