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
import 'package:inventory/src/core/domain/usecases/item/save_item_use_case.dart'
    as _i413;
import 'package:inventory/src/core/presentation/app_router.dart' as _i249;
import 'package:inventory/src/core/presentation/home_cubit.dart' as _i753;
import 'package:inventory/src/features/camera/presentation/camera_bloc.dart'
    as _i150;
import 'package:inventory/src/features/declutter/presentation/declutter_bloc.dart'
    as _i10;
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
    gh.lazySingleton<_i568.ItemRepository>(() => _i680.ItemRepositoryImpl(
        localDataSource: gh<_i653.LocalDatabaseDataSource>()));
    gh.lazySingleton<_i142.ImageScanRepository>(() =>
        _i612.ImageScanRepositoryImpl(
            imageScanDataSource: gh<_i218.ImageScanDataSource>()));
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
    gh.factory<_i778.DetailsBloc>(() => _i778.DetailsBloc(
          gh<_i989.GetItemByIdUseCase>(),
          gh<_i413.SaveItemUseCase>(),
          gh<_i12.ArchiveItemUseCase>(),
        ));
    gh.factory<_i10.DeclutterBloc>(
        () => _i10.DeclutterBloc(gh<_i568.ItemRepository>()));
    gh.factory<_i364.OverviewBloc>(
        () => _i364.OverviewBloc(gh<_i274.GetAllItemsUseCase>()));
    return this;
  }
}
