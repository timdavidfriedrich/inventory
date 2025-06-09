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
import 'package:inventory/core/data/datasources/local_database.dart' as _i965;
import 'package:inventory/core/data/datasources/local_database_data_source.dart'
    as _i834;
import 'package:inventory/core/data/datasources/local_database_data_source_impl.dart'
    as _i569;
import 'package:inventory/core/data/repositories/item_repository_impl.dart'
    as _i945;
import 'package:inventory/core/domain/repositories/item_repository.dart'
    as _i1052;

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
    await gh.factoryAsync<_i965.LocalDatabase>(
      () => _i965.LocalDatabase.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i834.LocalDatabaseDataSource>(() =>
        _i569.LocalDatabaseDataSourceImpl(
            localDatabase: gh<_i965.LocalDatabase>()));
    gh.lazySingleton<_i1052.ItemRepository>(() => _i945.ItemRepositoryImpl(
        localDataSource: gh<_i834.LocalDatabaseDataSource>()));
    return this;
  }
}
