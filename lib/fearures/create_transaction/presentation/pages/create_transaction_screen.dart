import 'package:CashClever/core/components/custom_tab_bar.dart';
import 'package:CashClever/core/components/primary_button.dart';
import 'package:CashClever/core/utils/colors.dart';
import 'package:CashClever/core/utils/dialog_utils.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/Create_transaction_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/calculator_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/category_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/states/create_transaction_states.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/amount.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/calculator_widget.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/date.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/category.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/divider_widget.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/cubits/date_cubit.dart';

class CreateTransactionScreen extends StatelessWidget {
  const CreateTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTransactionCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.reset();
      context.read<CategoryCubit>().reset();
      context.read<DateCubit>().reset();
      context.read<CalculatorCubit>().reset();
    });

    return BlocConsumer<CreateTransactionCubit, CreateTransactionState>(
      listener: (context, state) {
        if (state is CreateTransactionErrorState) {
          DialogUtils.showMessage(
            context: context,
            title: "Failed",
            message: state.failure.errorMessage,
            posActionName: "Close",
          );
        } else if (state is FieldsUnfilledErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure.errorMessage)));
        } else if (state is CreateTransactionSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Transaction added successfully.")));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              centerTitle: true,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: AppColors.white),
              ),
              title: Text(
                AppStrings.newTransaction,
                style: context.headlineMedium.copyWith(color: AppColors.white),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(
                  bottom: 60.sp, left: 20.sp, right: 20.sp, top: 20.sp),
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTabBar(
                      onTap: (index){
                        cubit.getType(index);
                      },
                      labels: [AppStrings.income, AppStrings.expenses]),
                  Amount(
                    amount: state is AmountUpdateState
                        ? state.updatedAmount
                        : cubit.amount,
                    onClicked: () => showCalculator(context, cubit),
                  ),
                  DividerWidget(),
                  Category(),
                  DividerWidget(),
                  Date(),
                  DividerWidget(),
                  Note(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: PrimaryButton(
                      onClicked: cubit.onSaveClicked,
                      label: state is CreateTransactionLoadingState
                          ? CircularProgressIndicator(color: AppColors.white)
                          : Text(AppStrings.save),
                      borderRadius: BorderRadius.circular(20),
                      backgroundColor: WidgetStatePropertyAll(AppColors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> showCalculator(BuildContext context, CreateTransactionCubit cubit) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (_) => CalculatorWidget(),
    );
    cubit.updateAmount(result);
  }
}

