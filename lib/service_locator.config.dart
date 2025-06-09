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
import 'package:inventory/src/core/presentation/app_router.dart' as _i249;
import 'package:inventory/src/core/presentation/home_cubit.dart' as _i753;

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
    gh.factory<_i249.AppRouter>(() => _i249.AppRouter());
    gh.factory<_i753.HomeCubit>(() => _i753.HomeCubit());
    gh.lazySingleton<_i653.LocalDatabaseDataSource>(() =>
        _i920.LocalDatabaseDataSourceImpl(
            localDatabase: gh<_i186.LocalDatabase>()));
    gh.lazySingleton<_i568.ItemRepository>(() => _i680.ItemRepositoryImpl(
        localDataSource: gh<_i653.LocalDatabaseDataSource>()));
    return this;
  }
}
