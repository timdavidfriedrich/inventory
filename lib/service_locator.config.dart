// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:inventory/src/core/data/datasources/local_database.dart'
    as _i186;
import 'package:inventory/src/core/data/datasources/local_database_data_source.dart'
    as _i653;
import 'package:inventory/src/core/data/datasources/local_database_data_source_impl.dart'
    as _i920;
import 'package:inventory/src/core/data/repositories/item_repository_impl.dart'
    as _i680;
import 'package:inventory/src/core/domain/repositories/item_repository.dart'
    as _i568;
import 'package:inventory/src/core/domain/usecases/item/archive_item_use_case.dart'
    as _i12;
import 'package:inventory/src/core/domain/usecases/item/get_all_items_use_case.dart'
    as _i274;
import 'package:inventory/src/core/domain/usecases/item/get_item_by_id_use_case.dart'
    as _i989;
import 'package:inventory/src/core/domain/usecases/item/get_items_by_location_id_use_case.dart'
    as _i667;
import 'package:inventory/src/core/domain/usecases/item/get_items_by_tag_use_case.dart'
    as _i123;
import 'package:inventory/src/core/domain/usecases/item/save_item_use_case.dart'
    as _i413;
import 'package:inventory/src/core/presentation/app_router.dart' as _i249;
import 'package:inventory/src/core/presentation/home_cubit.dart' as _i753;
import 'package:inventory/src/features/camera/presentation/camera_bloc.dart'
    as _i150;
import 'package:inventory/src/features/declutter/data/datasources/declutter_session_data_source.dart'
    as _i125;
import 'package:inventory/src/features/declutter/data/datasources/declutter_session_data_source_impl.dart'
    as _i1060;
import 'package:inventory/src/features/declutter/data/repositories/declutter_session_repository_impl.dart'
    as _i837;
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart'
    as _i314;
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/create_session_use_case.dart'
    as _i483;
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/delete_session_use_case.dart'
    as _i194;
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/get_current_session_item_use_case.dart'
    as _i806;
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/get_session_by_id_use_case.dart'
    as _i379;
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/update_session_use_case.dart'
    as _i156;
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/watch_active_sessions_use_case.dart'
    as _i94;
import 'package:inventory/src/features/declutter/domain/usecases/item/mark_to_keep_use_case.dart'
    as _i947;
import 'package:inventory/src/features/declutter/domain/usecases/item/mark_to_move_use_case.dart'
    as _i468;
import 'package:inventory/src/features/declutter/domain/usecases/item/mark_to_toss_use_case.dart'
    as _i944;
import 'package:inventory/src/features/declutter/presentation/declutter_bloc.dart'
    as _i10;
import 'package:inventory/src/features/declutter/presentation/hub/hub_bloc.dart'
    as _i1006;
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_bloc.dart'
    as _i970;
import 'package:inventory/src/features/details/presentation/details_bloc.dart'
    as _i778;
import 'package:inventory/src/features/overview/presentation/overview_bloc.dart'
    as _i364;
import 'package:inventory/src/features/scan/data/datasources/image_scan_data_source.dart'
    as _i218;
import 'package:inventory/src/features/scan/data/datasources/remote_image_scan_data_source_impl.dart'
    as _i121;
import 'package:inventory/src/features/scan/data/repositories/image_scan_repository_impl.dart'
    as _i612;
import 'package:inventory/src/features/scan/domain/repositories/image_scan_repository.dart'
    as _i142;
import 'package:inventory/src/features/scan/presentation/scan_bloc.dart'
    as _i361;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.factoryAsync<_i186.LocalDatabase>(
      () => _i186.LocalDatabase.create(),
      preResolve: true,
    );
    gh.factory<_i753.HomeCubit>(() => _i753.HomeCubit());
    gh.factory<_i150.CameraBloc>(() => _i150.CameraBloc());
    gh.singleton<_i249.AppRouter>(() => _i249.AppRouter());
    gh.lazySingleton<_i218.ImageScanDataSource>(
        () => _i121.RemoteImageScanDataSourceImpl());
    gh.lazySingleton<_i653.LocalDatabaseDataSource>(() =>
        _i920.LocalDatabaseDataSourceImpl(
            localDatabase: gh<_i186.LocalDatabase>()));
    gh.lazySingleton<_i125.DeclutterSessionDataSource>(() =>
        _i1060.DeclutterSessionDataSourceImpl(
            localDatabase: gh<_i186.LocalDatabase>()));
    gh.lazySingleton<_i314.DeclutterSessionRepository>(() =>
        _i837.DeclutterSessionRepositoryImpl(
            dataSource: gh<_i125.DeclutterSessionDataSource>()));
    gh.lazySingleton<_i568.ItemRepository>(() => _i680.ItemRepositoryImpl(
        localDataSource: gh<_i653.LocalDatabaseDataSource>()));
    gh.lazySingleton<_i142.ImageScanRepository>(() =>
        _i612.ImageScanRepositoryImpl(
            imageScanDataSource: gh<_i218.ImageScanDataSource>()));
    gh.factory<_i123.GetItemsByTagUseCase>(() =>
        _i123.GetItemsByTagUseCase(itemRepository: gh<_i568.ItemRepository>()));
    gh.factory<_i667.GetItemsByLocationIdUseCase>(() =>
        _i667.GetItemsByLocationIdUseCase(
            itemRepository: gh<_i568.ItemRepository>()));
    gh.factory<_i361.ScanBloc>(
        () => _i361.ScanBloc(gh<_i142.ImageScanRepository>()));
    gh.factory<_i274.GetAllItemsUseCase>(
        () => _i274.GetAllItemsUseCase(repository: gh<_i568.ItemRepository>()));
    gh.factory<_i12.ArchiveItemUseCase>(
        () => _i12.ArchiveItemUseCase(repository: gh<_i568.ItemRepository>()));
    gh.factory<_i413.SaveItemUseCase>(
        () => _i413.SaveItemUseCase(repository: gh<_i568.ItemRepository>()));
    gh.factory<_i989.GetItemByIdUseCase>(
        () => _i989.GetItemByIdUseCase(repository: gh<_i568.ItemRepository>()));
    gh.factory<_i483.CreateSessionUseCase>(() => _i483.CreateSessionUseCase(
          itemRepository: gh<_i568.ItemRepository>(),
          sessionRepository: gh<_i314.DeclutterSessionRepository>(),
        ));
    gh.factory<_i194.DeleteSessionUseCase>(() =>
        _i194.DeleteSessionUseCase(gh<_i314.DeclutterSessionRepository>()));
    gh.factory<_i379.GetSessionByIdUseCase>(() =>
        _i379.GetSessionByIdUseCase(gh<_i314.DeclutterSessionRepository>()));
    gh.factory<_i94.WatchActiveSessionsUseCase>(() =>
        _i94.WatchActiveSessionsUseCase(
            gh<_i314.DeclutterSessionRepository>()));
    gh.factory<_i156.UpdateSessionUseCase>(() =>
        _i156.UpdateSessionUseCase(gh<_i314.DeclutterSessionRepository>()));
    gh.factory<_i778.DetailsBloc>(() => _i778.DetailsBloc(
          gh<_i989.GetItemByIdUseCase>(),
          gh<_i413.SaveItemUseCase>(),
          gh<_i12.ArchiveItemUseCase>(),
        ));
    gh.factory<_i806.GetCurrentSessionItemUseCase>(
        () => _i806.GetCurrentSessionItemUseCase(
              sessionRepository: gh<_i314.DeclutterSessionRepository>(),
              itemRepository: gh<_i568.ItemRepository>(),
            ));
    gh.factory<_i10.DeclutterBloc>(
        () => _i10.DeclutterBloc(gh<_i568.ItemRepository>()));
    gh.factory<_i468.MarkToMoveUseCase>(
        () => _i468.MarkToMoveUseCase(gh<_i568.ItemRepository>()));
    gh.factory<_i947.MarkToKeepUseCase>(
        () => _i947.MarkToKeepUseCase(gh<_i568.ItemRepository>()));
    gh.factory<_i944.MarkToTossUseCase>(
        () => _i944.MarkToTossUseCase(gh<_i568.ItemRepository>()));
    gh.factoryParam<_i970.SwipeBloc, int?, dynamic>((
      sessionId,
      _,
    ) =>
        _i970.SwipeBloc(
          gh<_i806.GetCurrentSessionItemUseCase>(),
          gh<_i379.GetSessionByIdUseCase>(),
          gh<_i194.DeleteSessionUseCase>(),
          gh<_i156.UpdateSessionUseCase>(),
          gh<_i947.MarkToKeepUseCase>(),
          gh<_i468.MarkToMoveUseCase>(),
          gh<_i944.MarkToTossUseCase>(),
          sessionId: sessionId,
        ));
    gh.factory<_i364.OverviewBloc>(
        () => _i364.OverviewBloc(gh<_i274.GetAllItemsUseCase>()));
    gh.factory<_i1006.HubBloc>(() => _i1006.HubBloc(
          gh<_i483.CreateSessionUseCase>(),
          gh<_i194.DeleteSessionUseCase>(),
          gh<_i94.WatchActiveSessionsUseCase>(),
        ));
    return this;
  }
}
