import 'package:CashClever/core/utils/firebase/firebase_utils.dart';
import 'package:CashClever/fearures/transactions/domain/repositories/get_all_transactions_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../create_transaction/domain/entities/transaction_entity.dart';
@injectable
class GetTransactionsByTypeUseCase{
  GetTransactionsByTypeRepo repo;
  GetTransactionsByTypeUseCase({required this.repo});

  Stream<Either<Failure, List<TransactionEntity>>> call(TypeFilter filter){
    return repo.getTransactionsByType(filter);
  }
}