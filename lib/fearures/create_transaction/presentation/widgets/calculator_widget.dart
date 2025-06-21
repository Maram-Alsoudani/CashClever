import 'package:CashClever/core/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:CashClever/core/utils/colors.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import '../manager/states/calculator_states.dart';
import '../manager/cubits/calculator_cubit.dart';


class CalculatorWidget extends StatelessWidget {
  List<List<String>> buttons = [
    ['c', '7', '4', '1', '00'],
    ['+', '8', '5', '2', '0'],
    ['-', '9', '6', '3', '.'],
    ['⌫', 'x', '÷', '='],
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state){
        final cubit = context.read<CalculatorCubit>();
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
                        state.output,
                        style: context.headlineMedium,
                      ),
                      TextButton(
                        child: Text(
                          "Done",
                          style: context.bodyLarge
                              .copyWith(color: AppColors.lightBlue),
                        ),
                        onPressed: () {
                          Navigator.pop(context, state.output);

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
                                    cubit.onButtonClicked(buttonText);
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
      },

    );
  }


}
