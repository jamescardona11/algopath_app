import 'package:algopath_app/presentation/pages/home_page/dashboard/dashboard_page.dart';
import 'package:algopath_app/presentation/pages/home_page/home_page.dart';
import 'package:algopath_app/presentation/pages/home_page/problem_path/problem_path_page.dart';
import 'package:algopath_app/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  initialLocation: '/',
  observers: [
    GoRouterNavigatorObserver(),
  ],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final slug = state.pathParameters['slug'];
        return HomePage(
          initialSlug: slug,
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: '/path/:slug',
          builder: (context, state) {
            final slug = state.pathParameters['slug'];
            return ProblemPathPage(slug: slug!);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(
        'Page not found: ${state.error}',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ),
  ),
);

class GoRouterNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    AppLogger().i('GoRouter: didPush: $route');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    AppLogger().i('GoRouter: didPop: $route');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    AppLogger().i('GoRouter: didRemove: $route');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? oldRoute, Route? newRoute}) {
    AppLogger().i('GoRouter: didReplace: $oldRoute -> $newRoute');
    super.didReplace(oldRoute: oldRoute, newRoute: newRoute);
  }
}
