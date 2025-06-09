import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/core/presentation/home_shell.dart';
import 'package:inventory/features/archive/presentation/archive_screen.dart';
import 'package:inventory/features/details/presentation/details_screen.dart';
import 'package:inventory/features/scan/presentation/scan_screen.dart';
import 'package:inventory/features/settings/presentation/settings_screen.dart';

part 'app_router.g.dart';

@injectable
class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
          initialLocation: HomeShell.routeName,
          routes: $appRoutes,
        ) {
    _logBackStack();
  }

  void _logBackStack() {
    router.routerDelegate.addListener(() {
      final names = router.routerDelegate.currentConfiguration.matches.map((m) {
        return m.matchedLocation;
      }).toList();
      // TODO: Replace debugPrint with log package
      debugPrint('🏷️ GoRouter Stack via listener: $names');
    });
  }
}

@TypedGoRoute<HomeRoute>(path: HomeShell.routeName)
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeShell();
  }
}

@TypedGoRoute<ArchiveRoute>(path: ArchiveScreen.routeName)
class ArchiveRoute extends GoRouteData with _$ArchiveRoute {
  const ArchiveRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ArchiveScreen();
  }
}

@TypedGoRoute<DetailsRoute>(path: DetailsScreen.routeName)
class DetailsRoute extends GoRouteData with _$DetailsRoute {
  const DetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailsScreen();
  }
}

@TypedGoRoute<ScanRoute>(path: ScanScreen.routeName)
class ScanRoute extends GoRouteData with _$ScanRoute {
  const ScanRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ScanScreen();
  }
}

@TypedGoRoute<SettingsRoute>(path: SettingsScreen.routeName)
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
