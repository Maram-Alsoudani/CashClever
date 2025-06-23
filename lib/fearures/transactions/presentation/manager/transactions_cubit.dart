import 'package:CashClever/core/utils/firebase/firebase_utils.dart';
import 'package:CashClever/fearures/transactions/domain/use_cases/get_all_transactions_use_case.dart';
import 'package:CashClever/fearures/transactions/presentation/manager/transactions_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransactionsCubit extends Cubit<TransactionsState> {
  GetTransactionsByTypeUseCase useCase;

  TransactionsCubit({required this.useCase})
      : super(TransactionsInitialState());

  List<TypeFilter> filters = [
    TypeFilter.all,
    TypeFilter.income,
    TypeFilter.expenses
  ];

  displayTransactions(int selectedTabIndex) {
    emit(TransactionsLoadingState());
    useCase.call(filters[selectedTabIndex]).listen((either) {
      either.fold((error) {
        emit(TransactionsErrorState(failure: error));
      }, (transactionsList) {
        emit(TransactionsSuccessState(transactions: transactionsList));
      });
    });
  }
}
