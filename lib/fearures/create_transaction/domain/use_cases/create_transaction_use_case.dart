import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:CashClever/fearures/create_transaction/domain/repositories/transactions_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
@injectable
class CreateTransactionUseCase{
  TransactionsRepo transactionsRepo;
  CreateTransactionUseCase({
    required this.transactionsRepo
});
  Future<Either<Failure, void>> call(TransactionEntity transaction){
    return transactionsRepo.createTransaction(transaction);
  }
}