import 'package:CashClever/core/errors/failures.dart';
import '../../../create_transaction/domain/entities/transaction_entity.dart';

abstract class TransactionsState{}
class TransactionsInitialState extends TransactionsState{}
class TransactionsLoadingState extends TransactionsState{}
class TransactionsErrorState extends TransactionsState{
  Failure failure;
  TransactionsErrorState({required this.failure});
}
class TransactionsSuccessState extends TransactionsState{
  List<TransactionEntity> transactions;

  TransactionsSuccessState({required this.transactions});
}