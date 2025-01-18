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
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelPadding: EdgeInsets.all(0.sp),
                  labelStyle:
                      context.bodySmall.copyWith(color: AppColors.black),
                  labelColor: AppColors.white,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  tabs: [
                    Center(child: Tab(text: AppStrings.all)),
                    Center(child: Tab(text: AppStrings.incoming)),
                    Center(child: Tab(text: AppStrings.expenses)),
                  ],
                ),
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
