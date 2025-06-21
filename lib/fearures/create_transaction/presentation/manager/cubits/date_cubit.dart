import 'package:CashClever/fearures/create_transaction/presentation/manager/states/date_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateCubit extends Cubit<DateState>{

  DateCubit():super(DateInitialState());
  updateDate(DateTime? newSelectedDate){
 if(newSelectedDate != null){
   emit(DateUpdatedState(updatedDate: newSelectedDate));
 }
  }
  void reset(){
    emit(DateInitialState());
  }
}