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
      $cameraRoute,
      $scanRoute,
      $settingsRoute,
      $declutterSwipeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: _$HomeRoute._fromState,
    );

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $archiveRoute => GoRouteData.$route(
      path: '/archive',
      factory: _$ArchiveRoute._fromState,
    );

mixin _$ArchiveRoute on GoRouteData {
  static ArchiveRoute _fromState(GoRouterState state) => const ArchiveRoute();

  @override
  String get location => GoRouteData.$location(
        '/archive',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
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

  @override
  String get location => GoRouteData.$location(
        '/details',
        queryParams: {
          if (_self.id != null) 'id': _self.id!.toString(),
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
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
  static DetailsFromScanRoute _fromState(GoRouterState state) =>
      DetailsFromScanRoute(
        state.extra as ScanResultWithImage?,
      );

  DetailsFromScanRoute get _self => this as DetailsFromScanRoute;

  @override
  String get location => GoRouteData.$location(
        '/detailsFromScan',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $cameraRoute => GoRouteData.$route(
      path: '/camera',
      factory: _$CameraRoute._fromState,
    );

mixin _$CameraRoute on GoRouteData {
  static CameraRoute _fromState(GoRouterState state) => const CameraRoute();

  @override
  String get location => GoRouteData.$location(
        '/camera',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $scanRoute => GoRouteData.$route(
      path: '/scan',
      factory: _$ScanRoute._fromState,
    );

mixin _$ScanRoute on GoRouteData {
  static ScanRoute _fromState(GoRouterState state) => ScanRoute(
        state.extra as Uint8List,
      );

  ScanRoute get _self => this as ScanRoute;

  @override
  String get location => GoRouteData.$location(
        '/scan',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: _$SettingsRoute._fromState,
    );

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location(
        '/settings',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $declutterSwipeRoute => GoRouteData.$route(
      path: '/declutter/swipe',
      factory: _$DeclutterSwipeRoute._fromState,
    );

mixin _$DeclutterSwipeRoute on GoRouteData {
  static DeclutterSwipeRoute _fromState(GoRouterState state) =>
      DeclutterSwipeRoute(
        sessionId: _$convertMapValue(
            'session-id', state.uri.queryParameters, int.tryParse),
      );

  DeclutterSwipeRoute get _self => this as DeclutterSwipeRoute;

  @override
  String get location => GoRouteData.$location(
        '/declutter/swipe',
        queryParams: {
          if (_self.sessionId != null)
            'session-id': _self.sessionId!.toString(),
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
