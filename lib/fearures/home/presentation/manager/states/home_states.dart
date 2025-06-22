import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';

abstract class HomeState{}
class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeErrorState extends HomeState{
  Failure failure;
  HomeErrorState({required this.failure});
}
class HomeSuccessState extends HomeState{
  List<TransactionEntity> transactions;
  HomeSuccessState({required this.transactions});

}