// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $archiveRoute,
      $detailsRoute,
      $detailsFromScanRoute,
      $scanRoute,
      $settingsRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: _$HomeRoute._fromState,
    );

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $archiveRoute => GoRouteData.$route(
      path: '/archive',
      factory: _$ArchiveRoute._fromState,
    );

mixin _$ArchiveRoute on GoRouteData {
  static ArchiveRoute _fromState(GoRouterState state) => const ArchiveRoute();

  String get location => GoRouteData.$location(
        '/archive',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $detailsRoute => GoRouteData.$route(
      path: '/details',
      factory: _$DetailsRoute._fromState,
    );

mixin _$DetailsRoute on GoRouteData {
  static DetailsRoute _fromState(GoRouterState state) => DetailsRoute(
        id: _$convertMapValue('id', state.uri.queryParameters, int.tryParse),
      );

  DetailsRoute get _self => this as DetailsRoute;

  String get location => GoRouteData.$location(
        '/details',
        queryParams: {
          if (_self.id != null) 'id': _self.id!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

RouteBase get $detailsFromScanRoute => GoRouteData.$route(
      path: '/detailsFromScan',
      factory: _$DetailsFromScanRoute._fromState,
    );

mixin _$DetailsFromScanRoute on GoRouteData {
  static DetailsFromScanRoute _fromState(GoRouterState state) => DetailsFromScanRoute(
        state.extra as ScanResultWithImage?,
      );

  DetailsFromScanRoute get _self => this as DetailsFromScanRoute;

  String get location => GoRouteData.$location(
        '/detailsFromScan',
      );

  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location, extra: _self.$extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  void replace(BuildContext context) => context.replace(location, extra: _self.$extra);
}

RouteBase get $scanRoute => GoRouteData.$route(
      path: '/scan',
      factory: _$ScanRoute._fromState,
    );

mixin _$ScanRoute on GoRouteData {
  static ScanRoute _fromState(GoRouterState state) => const ScanRoute();

  String get location => GoRouteData.$location(
        '/scan',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: _$SettingsRoute._fromState,
    );

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
