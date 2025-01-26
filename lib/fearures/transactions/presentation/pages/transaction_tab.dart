import 'package:finsage/core/components/custom_tab_bar.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:finsage/fearures/transactions/presentation/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';

class TransactionTab extends StatelessWidget {
  const TransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
              ),
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
                child: CustomTabBar(labels: [
                  AppStrings.all,
                  AppStrings.incoming,
                  AppStrings.expenses
                ]),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                  return TransactionWidget(
                      amount: "-5000",
                      category: "Shopping",
                      date: "10:00 AM",
                      description: "Buy some grocery");
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
