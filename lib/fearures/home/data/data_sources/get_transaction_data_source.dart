import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/firebase/firebase_utils.dart';

abstract class GetTransactionsDataSource{
  Stream<Either<Failure, List<TransactionEntity>>> getTransactions(TimeFilter filteredBy);
}