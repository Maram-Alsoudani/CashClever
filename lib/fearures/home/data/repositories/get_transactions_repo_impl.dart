import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:CashClever/fearures/home/data/data_sources/get_transaction_data_source.dart';
import 'package:CashClever/fearures/home/domain/repositories/get_transactions_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/firebase/firebase_utils.dart';
import '../../presentation/manager/cubit/home_cubit.dart';
@Injectable(as: GetTransactionsRepo)
class GetTransactionsRepoImpl implements GetTransactionsRepo{
  GetTransactionsDataSource dataSource;
GetTransactionsRepoImpl({required this.dataSource});
  @override
  Stream<Either<Failure, List<TransactionEntity>>> getTransactions(TimeFilter filter) {
    return dataSource.getTransactions(filter);
  }

}