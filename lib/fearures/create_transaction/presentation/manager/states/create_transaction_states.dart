import 'package:CashClever/core/errors/failures.dart';

abstract class CreateTransactionState{}
class CreateTransactionInitialState extends CreateTransactionState{
  CreateTransactionInitialState();
}
class AmountUpdateState extends CreateTransactionState{
  String updatedAmount;
  AmountUpdateState({required this.updatedAmount});
}
class CategoryUpdatedState extends CreateTransactionState{}
class CreateTransactionLoadingState extends CreateTransactionState{}
class CreateTransactionErrorState extends CreateTransactionState{
  Failure failure;
  CreateTransactionErrorState({required this.failure});
}
class FieldsUnfilledErrorState extends CreateTransactionState{
  Failure failure;
  FieldsUnfilledErrorState({required this.failure});
}
class CreateTransactionSuccessState extends CreateTransactionState{}

