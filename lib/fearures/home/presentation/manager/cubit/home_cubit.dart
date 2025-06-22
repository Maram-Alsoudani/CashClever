import 'package:CashClever/core/cache/shared_preferences.dart';
import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/auth/data/models/user_model.dart';
import 'package:CashClever/fearures/home/domain/use_cases/get_transactions_use_case.dart';
import 'package:CashClever/fearures/home/presentation/manager/states/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetTransactionUseCase useCase;
  UserModel? prefsUser = SharedPrefs.getData(key: AppStrings.loggedInUserKey);
  HomeCubit({required this.useCase}) : super(HomeInitialState());

  final List<TimeFilter> filters = [
    TimeFilter.today,
    TimeFilter.week,
    TimeFilter.month,
  ];
  void displayTransactions(int selectedTabIndex) {
    emit(HomeLoadingState());

    useCase.call(filters[selectedTabIndex]).listen((either) {
      either.fold(
            (error) => emit(HomeErrorState(failure: error)),
            (transactionsList)  {
              emit(HomeSuccessState(transactions: transactionsList));},
      );
    });
  }
}

enum TimeFilter {
  today,
  week,
  month,
}