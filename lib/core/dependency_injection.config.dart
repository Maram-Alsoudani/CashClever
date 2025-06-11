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

import '../fearures/auth/data/data_sources/auth_data_source.dart' as _i413;
import '../fearures/auth/data/data_sources/auth_data_source_impl.dart' as _i216;
import '../fearures/auth/data/repositories/auth_repo_impl.dart' as _i1042;
import '../fearures/auth/domain/repositories/auth_repository.dart' as _i929;
import '../fearures/auth/domain/use_cases/login_use_case.dart' as _i308;
import '../fearures/auth/domain/use_cases/register_use_case.dart' as _i829;
import '../fearures/auth/presentation/manager/login_view_model.dart' as _i1030;
import '../fearures/auth/presentation/manager/register_view_model.dart'
    as _i958;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i413.AuthDataSource>(() => _i216.AuthDataSourceImpl());
    gh.factory<_i929.AuthRepo>(
        () => _i1042.AuthRepoImpl(authDataSource: gh<_i413.AuthDataSource>()));
    gh.factory<_i308.LoginUseCase>(
        () => _i308.LoginUseCase(authRepo: gh<_i929.AuthRepo>()));
    gh.factory<_i829.RegisterUseCase>(
        () => _i829.RegisterUseCase(registerRepo: gh<_i929.AuthRepo>()));
    gh.factory<_i958.RegisterViewModel>(() =>
        _i958.RegisterViewModel(registerUseCase: gh<_i829.RegisterUseCase>()));
    gh.factory<_i1030.LoginViewModel>(
        () => _i1030.LoginViewModel(loginUseCase: gh<_i308.LoginUseCase>()));
    return this;
  }
}
