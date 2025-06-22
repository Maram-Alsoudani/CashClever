import 'package:CashClever/fearures/home/domain/repositories/get_transactions_repo.dart';
import 'package:CashClever/fearures/home/presentation/manager/cubit/home_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../create_transaction/domain/entities/transaction_entity.dart';
@injectable
class GetTransactionUseCase{
  GetTransactionsRepo getTransactionRepo;
  GetTransactionUseCase({required this.getTransactionRepo});
  Stream<Either<Failure, List<TransactionEntity>>> call(TimeFilter filter){
    return getTransactionRepo.getTransactions(filter);
  }
}