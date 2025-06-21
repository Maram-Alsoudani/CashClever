import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/fearures/create_transaction/data/data_sources/transactions_data_source.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/transactions_repo.dart';
@Injectable(as: TransactionsRepo)
class TransactionsRepoImpl extends TransactionsRepo{
  TransactionsDataSource transactionDatasource;
  TransactionsRepoImpl({
    required this.transactionDatasource
});
  @override
  Future<Either<Failure, void>> createTransaction(TransactionEntity transaction) {
    return transactionDatasource.createTransaction(transaction);

  }

}