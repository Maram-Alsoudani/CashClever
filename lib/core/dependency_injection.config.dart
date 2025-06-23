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
import '../fearures/auth/domain/use_cases/forgot_pass_use_case.dart' as _i828;
import '../fearures/auth/domain/use_cases/login_use_case.dart' as _i308;
import '../fearures/auth/domain/use_cases/register_use_case.dart' as _i829;
import '../fearures/auth/presentation/manager/login_cubit.dart' as _i808;
import '../fearures/auth/presentation/manager/register_cubit.dart' as _i471;
import '../fearures/auth/presentation/manager/resetPass_cubit.dart' as _i886;
import '../fearures/create_transaction/data/data_sources/transactions_data_source.dart'
    as _i429;
import '../fearures/create_transaction/data/data_sources/transactions_data_source_impl.dart'
    as _i978;
import '../fearures/create_transaction/data/repositories/transactions_repo_impl.dart'
    as _i307;
import '../fearures/create_transaction/domain/repositories/transactions_repo.dart'
    as _i578;
import '../fearures/create_transaction/domain/use_cases/create_transaction_use_case.dart'
    as _i520;
import '../fearures/create_transaction/presentation/manager/cubits/Create_transaction_cubit.dart'
    as _i169;
import '../fearures/home/data/data_sources/get_transaction_data_source.dart'
    as _i752;
import '../fearures/home/data/data_sources/get_transactions_data_source_impl.dart'
    as _i656;
import '../fearures/home/data/repositories/get_transactions_repo_impl.dart'
    as _i428;
import '../fearures/home/domain/repositories/get_transactions_repo.dart'
    as _i11;
import '../fearures/home/domain/use_cases/get_transactions_use_case.dart'
    as _i498;
import '../fearures/home/presentation/manager/cubit/home_cubit.dart' as _i734;
import '../fearures/transactions/data/data_sources/get_all_transactions_data_source.dart'
    as _i390;
import '../fearures/transactions/data/data_sources/get_all_transactions_data_source_impl.dart'
    as _i287;
import '../fearures/transactions/data/repositories/get_all_transactions_repo_impl.dart'
    as _i440;
import '../fearures/transactions/domain/repositories/get_all_transactions_repo.dart'
    as _i1004;
import '../fearures/transactions/domain/use_cases/get_all_transactions_use_case.dart'
    as _i279;
import '../fearures/transactions/presentation/manager/transactions_cubit.dart'
    as _i907;

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
    gh.factory<_i752.GetTransactionsDataSource>(
        () => _i656.GetTransactionsDataSourceImpl());
    gh.factory<_i390.GetTransactionsByTypeDataSource>(
        () => _i287.GetTransactionsByTypeDataSourceImpl());
    gh.factory<_i429.TransactionsDataSource>(
        () => _i978.TransactionsDataSourceImpl());
    gh.factory<_i413.AuthDataSource>(() => _i216.AuthDataSourceImpl());
    gh.factory<_i1004.GetTransactionsByTypeRepo>(() =>
        _i440.GetTransactionsByTypeRepoImpl(
            dataSource: gh<_i390.GetTransactionsByTypeDataSource>()));
    gh.factory<_i11.GetTransactionsRepo>(() => _i428.GetTransactionsRepoImpl(
        dataSource: gh<_i752.GetTransactionsDataSource>()));
    gh.factory<_i929.AuthRepo>(
        () => _i1042.AuthRepoImpl(authDataSource: gh<_i413.AuthDataSource>()));
    gh.factory<_i578.TransactionsRepo>(() => _i307.TransactionsRepoImpl(
        transactionDatasource: gh<_i429.TransactionsDataSource>()));
    gh.factory<_i829.RegisterUseCase>(
        () => _i829.RegisterUseCase(registerRepo: gh<_i929.AuthRepo>()));
    gh.factory<_i471.RegisterCubit>(() =>
        _i471.RegisterCubit(registerUseCase: gh<_i829.RegisterUseCase>()));
    gh.factory<_i279.GetTransactionsByTypeUseCase>(() =>
        _i279.GetTransactionsByTypeUseCase(
            repo: gh<_i1004.GetTransactionsByTypeRepo>()));
    gh.factory<_i498.GetTransactionUseCase>(() => _i498.GetTransactionUseCase(
        getTransactionRepo: gh<_i11.GetTransactionsRepo>()));
    gh.factory<_i828.ForgotPassUseCase>(
        () => _i828.ForgotPassUseCase(authRepo: gh<_i929.AuthRepo>()));
    gh.factory<_i308.LoginUseCase>(
        () => _i308.LoginUseCase(authRepo: gh<_i929.AuthRepo>()));
    gh.factory<_i734.HomeCubit>(
        () => _i734.HomeCubit(useCase: gh<_i498.GetTransactionUseCase>()));
    gh.factory<_i520.CreateTransactionUseCase>(() =>
        _i520.CreateTransactionUseCase(
            transactionsRepo: gh<_i578.TransactionsRepo>()));
    gh.factory<_i886.ResetPassCubit>(() =>
        _i886.ResetPassCubit(forgotPassUseCase: gh<_i828.ForgotPassUseCase>()));
    gh.factory<_i169.CreateTransactionCubit>(() => _i169.CreateTransactionCubit(
        useCase: gh<_i520.CreateTransactionUseCase>()));
    gh.factory<_i907.TransactionsCubit>(() => _i907.TransactionsCubit(
        useCase: gh<_i279.GetTransactionsByTypeUseCase>()));
    gh.factory<_i808.LoginCubit>(
        () => _i808.LoginCubit(loginUseCase: gh<_i308.LoginUseCase>()));
    return this;
  }
}
