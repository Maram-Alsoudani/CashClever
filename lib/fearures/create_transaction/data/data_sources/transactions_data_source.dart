import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionsDataSource{
  Future<Either<Failure, void>>createTransaction(TransactionEntity transaction);
}