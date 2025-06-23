import 'package:CashClever/core/utils/firebase/firebase_utils.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../create_transaction/domain/entities/transaction_entity.dart';

abstract class GetTransactionsByTypeRepo{
  Stream<Either<Failure, List<TransactionEntity>>> getTransactionsByType(TypeFilter filter);
}