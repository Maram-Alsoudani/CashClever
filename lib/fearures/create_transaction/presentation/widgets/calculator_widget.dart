import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorWidget extends StatefulWidget {
  String output;

  CalculatorWidget({super.key, required this.output});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  late String output;

  List<List<String>> buttons = [
    ['c', '7', '4', '1', '00'],
    ['+', '8', '5', '2', '0'],
    ['-', '9', '6', '3', '.'],
    ['⌫', 'x', '÷', '='],
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    output = widget.output;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350.h,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    output,
                    style: context.headlineMedium,
                  ),
                  TextButton(
                    child: Text(
                      "Done",
                      style: context.bodyLarge
                          .copyWith(color: AppColors.lightBlue),
                    ),
                    onPressed: () {
                      Navigator.pop(context, output);
                    },
                  )
                ],
              ),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buttons.map((list) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: list.map((buttonText) {
                        bool isOperator = ['+', '-', 'x', '÷', '=', '⌫', 'c']
                            .contains(buttonText);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: buttonText == "=" ? 41 : 10,
                                        horizontal: 24)),
                                backgroundColor: isOperator
                                    ? buttonText == '='
                                        ? WidgetStatePropertyAll(
                                            AppColors.lightBlue)
                                        : WidgetStatePropertyAll(
                                            AppColors.babyBlue)
                                    : WidgetStatePropertyAll(
                                        AppColors.lightGray),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                              ),
                              onPressed: () {
                                isOperator
                                    ? onOperatorClicked(buttonText)
                                    : setState(() {
                                        if (output == '0.0') {
                                          output = '';
                                          output = buttonText;
                                        } else {
                                          output += buttonText;
                                        }
                                      });
                              },
                              child: Text(buttonText,
                                  style: context.bodyLarge
                                      .copyWith(color: AppColors.black))),
                        );
                      }).toList(),
                    ),
                  );
                }).toList())
          ],
        ));
  }

  String lhs = '';
  String clickedOperator = '';
  bool isResultShown = false;

  onOperatorClicked(String operator) {
    if (operator == '=') {
      onEqualClicked();
      return;
    } else if (operator == '⌫') {
      onBackspaceClicked(output);
      return;
    } else if (operator == 'c') {
      onClearClicked();
      return;
    }
    if (clickedOperator.isEmpty) {
      lhs = output;
    } else {
      String rhs = output;
      lhs = calculate(lhs, operator, rhs);
    }
    clickedOperator = operator;
    output = '';
    isResultShown = false;

    setState(() {});
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
      String rhs = output;
      output = calculate(lhs, clickedOperator, rhs);
      lhs = '';
      clickedOperator = '';
      isResultShown = true;
      setState(() {});
    } else {
      output = '';
      setState(() {});
    }
  }

  void onBackspaceClicked(String theOutput) {
    if (!isResultShown) {
      String result = output.substring(0, output.length - 1);
      output = result;
      setState(() {});
    }
  }

  void onClearClicked() {
    setState(() {
      output = '0.0';
      clickedOperator = '';
      lhs = '';
    });
  }
}
