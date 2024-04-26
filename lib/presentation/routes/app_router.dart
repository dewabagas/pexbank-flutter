import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pexbank/presentation/routes/app_route_paths.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    routerNeglect: true,
    // debugLogDiagnostics: true,
    routes: [
      // CORE
      // GoRoute(
      //     path: RoutePaths.splash,
      //     builder: (context, state) => const PageSplash()),
      // // DASHBOARD
      // GoRoute(
      //     path: RoutePaths.dashboard,
      //     builder: (context, state) => const PageDashboard()),
    ],
    errorBuilder: (context, state) {
      return Container();
    },
    redirect: (context, state) {},
  );
}
