abstract class CalculatorState {
   String output;
   CalculatorState({ required this.output});
}

class CalculatorInitial extends CalculatorState {
   CalculatorInitial() : super( output: '0.0');
}

class CalculatorOutputChanged extends CalculatorState {
   CalculatorOutputChanged(String output) : super(output:output);
}

class CalculatorCleared extends CalculatorState {
   CalculatorCleared() : super(output: '0.0');
}
