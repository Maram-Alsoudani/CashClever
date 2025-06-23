import 'package:CashClever/core/components/custom_tab_bar.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/transactions/presentation/manager/transactions_cubit.dart';
import 'package:CashClever/fearures/transactions/presentation/manager/transactions_states.dart';
import 'package:CashClever/fearures/transactions/presentation/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';

class TransactionTab extends StatefulWidget {
  const TransactionTab({super.key});

  @override
  State<TransactionTab> createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab> {
  late TransactionsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<TransactionsCubit>();
    cubit.displayTransactions(0);
  }

  @override
  Widget build(BuildContext context) {
    Object? argument = ModalRoute.of(context)!.settings.arguments;
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: argument == null
                    ? IconButton(
                        onPressed: () {},
                        icon: Container(),
                      )
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: argument as Widget,
                      ),
                title: Text(
                  AppStrings.transactions,
                  style: context.headlineMedium.copyWith(fontSize: 24.sp),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    margin: EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: CustomTabBar(
                        onTap: (index) {
                          cubit.displayTransactions(index);
                        },
                        labels: [
                          AppStrings.all,
                          AppStrings.incoming,
                          AppStrings.expenses
                        ]),
                  ),
                  state is TransactionsSuccessState
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: state.transactions.length,
                              itemBuilder: (context, index) {
                                var transaction = state.transactions[index];
                                return TransactionWidget(
                                    type: transaction.type,
                                    amount: transaction.amount.toString(),
                                    category: transaction.category,
                                    date: transaction.time,
                                    description: transaction.note);
                              }),
                        )
                      : state is TransactionsErrorState
                          ? Text(state.failure.errorMessage)
                          : CircularProgressIndicator()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
