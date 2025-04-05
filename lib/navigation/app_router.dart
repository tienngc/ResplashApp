import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:resplash/screens/home/home_screen.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[],
    ),
  ],
  errorBuilder: (context, state) => Center(
    child: Text("Page not found"),
  ),
);
