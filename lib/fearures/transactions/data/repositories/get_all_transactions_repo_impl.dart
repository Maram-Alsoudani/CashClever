import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/core/utils/firebase/firebase_utils.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:CashClever/fearures/transactions/data/data_sources/get_all_transactions_data_source.dart';
import 'package:CashClever/fearures/transactions/domain/repositories/get_all_transactions_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetTransactionsByTypeRepo)

 class GetTransactionsByTypeRepoImpl implements GetTransactionsByTypeRepo{
  GetTransactionsByTypeDataSource dataSource;
  GetTransactionsByTypeRepoImpl({required this.dataSource});
  @override
  Stream<Either<Failure, List<TransactionEntity>>> getTransactionsByType(TypeFilter filter) {
    return dataSource.getTransactionsByType(filter);
  }

}