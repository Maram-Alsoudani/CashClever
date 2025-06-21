import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:CashClever/fearures/create_transaction/domain/use_cases/create_transaction_use_case.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/states/create_transaction_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  CreateTransactionUseCase useCase;

  CreateTransactionCubit({required this.useCase})
      : super(CreateTransactionInitialState());

  String type = 'income';
  String amount = "0.0";
  String? selectedCategory;
  DateTime? selectedDate;
  TextEditingController noteController = TextEditingController();

  getType(int index) {
    if (index == 1) {
      type = "expenses";
    }
  }

  updateAmount(dynamic result) {
    if (result != null) {
      emit(AmountUpdateState(updatedAmount: result));
      amount = result;
    }
  }

  updateCategory(String category) {
    selectedCategory = category;
  }

  updateDate(DateTime date) {
    selectedDate = date;
  }

  onSaveClicked() async {
    if (amount == "0.0" || selectedCategory == null || selectedDate == null) {
      emit(FieldsUnfilledErrorState(
          failure: Failure(errorMessage: "All fields are required")));
    } else {
      emit(CreateTransactionLoadingState());
      try {
        TransactionEntity transaction = TransactionEntity(
            type: type,
            amount: double.parse(amount),
            category: selectedCategory!,
            time: selectedDate!,
            note: noteController.text ?? "");
        var either = await useCase.call(transaction);
        either.fold((error) {
          emit(CreateTransactionErrorState(failure: error));
        }, (success) {
          emit(CreateTransactionSuccessState());
        });
      } catch (e) {
        emit(CreateTransactionErrorState(
            failure: Failure(errorMessage: e.toString())));
      }
    }
  }

  reset() {
    updateAmount("0.0");
    noteController.clear();
  }
}
