import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';
import 'package:inventory/src/core/presentation/home_shell.dart';
import 'package:inventory/src/features/archive/presentation/archive_screen.dart';
import 'package:inventory/src/features/camera/presentation/camera_screen.dart';
import 'package:inventory/src/features/details/presentation/details_screen.dart';
import 'package:inventory/src/features/scan/presentation/scan_screen.dart';
import 'package:inventory/src/features/settings/presentation/settings_screen.dart';
import 'package:log/log.dart';

part 'app_router.g.dart';

@singleton
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
      Log.debug("🏷️ GoRouter Stack via listener: $names");
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
  final int? id;
  const DetailsRoute({this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailsScreen(id: id);
  }
}

@TypedGoRoute<DetailsFromScanRoute>(path: DetailsScreen.routeNameFromScan)
class DetailsFromScanRoute extends GoRouteData with _$DetailsFromScanRoute {
  final ScanResultWithImage? $extra;
  const DetailsFromScanRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailsScreen(scanResult: $extra);
  }
}

@TypedGoRoute<CameraRoute>(path: CameraScreen.routeName)
class CameraRoute extends GoRouteData with _$CameraRoute {
  const CameraRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CameraScreen();
  }
}

@TypedGoRoute<ScanRoute>(path: ScanScreen.routeName)
class ScanRoute extends GoRouteData with _$ScanRoute {
  final Uint8List $extra;
  const ScanRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ScanScreen(imageData: $extra);
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
