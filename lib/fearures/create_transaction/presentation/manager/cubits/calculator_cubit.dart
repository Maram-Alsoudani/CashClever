import 'package:CashClever/fearures/create_transaction/presentation/manager/states/calculator_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorState>{
  CalculatorCubit(): super(CalculatorInitial());

  String lhs = '';
  String clickedOperator = '';
  bool isResultShown = false;

  onButtonClicked(String buttonVal){
    bool isOperator = ['+', '-', 'x', '÷', '=', '⌫', 'c']
        .contains(buttonVal);

    if(isOperator){
      onOperatorClicked(buttonVal);
    }else{
      if(state.output=='0.0'){
        emit(CalculatorOutputChanged(buttonVal));
      }else{
        emit(CalculatorOutputChanged(state.output+buttonVal));
      }
    }
  }

  onOperatorClicked(String operator) {
    if (operator == '=') {
      onEqualClicked();
      return;
    } else if (operator == '⌫') {
      onBackspaceClicked();
      return;
    } else if (operator == 'c') {
      onClearClicked();
      return;
    }
    if (clickedOperator.isEmpty) {
      lhs = state.output;
    } else {
      String rhs = state.output;
      lhs = calculate(lhs, operator, rhs);
      isResultShown= false;
    }
    clickedOperator = operator;
    isResultShown = false;
    emit(CalculatorOutputChanged(''));
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double result = 0.0;
    if (operator == "+") {
      result = num1 + num2;
    } else if (operator == "-") {
      result = num1 - num2;
    } else if (operator == "x") {
      result = num1 * num2;
    } else if (operator == '÷') {
      result = num1 / num2;
    }

    return result.toString();
  }

  void onEqualClicked() {
    if (clickedOperator.isNotEmpty) {
      String rhs = state.output;
      String result = calculate(lhs, clickedOperator, rhs);
      lhs = '';
      clickedOperator = '';
      isResultShown = true;
      emit(CalculatorOutputChanged(result));
    } else {
      emit(CalculatorOutputChanged(''));

    }
  }

  void onBackspaceClicked() {
    if (!isResultShown && state.output.isNotEmpty) {
      String result = state.output.substring(0, state.output.length - 1);
      emit(CalculatorOutputChanged(result));
    }
  }

  void onClearClicked() {
    lhs = '';
    clickedOperator = '';
    isResultShown = false;
    emit(CalculatorCleared());
  }

  void reset(){
    emit(CalculatorInitial());
  }
}