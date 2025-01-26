import 'package:finsage/core/components/custom_tab_bar.dart';
import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:finsage/fearures/budget/presentation/widgets/percent_bar_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetTab extends StatefulWidget {
  const BudgetTab({super.key});

  @override
  State<BudgetTab> createState() => _BudgetTabState();
}

class _BudgetTabState extends State<BudgetTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.financialReport,
            style: context.headlineMedium.copyWith(fontSize: 24.sp, color: AppColors.primary),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0.sp),
            child: Column(
              children: [
                SizedBox(height: 80.h,),
                Container(
                  margin: EdgeInsets.only(bottom: 30.sp),
                  width: double.infinity,
                  height: 200.h,
                  child: PieChart(
                      PieChartData(
                          sectionsSpace: 0.sp,
                          centerSpaceRadius: 0.sp,
                          sections: [
                            PieChartSectionData(
                                radius: 120.r,
                                value: 10,
                                color: AppColors.yellow
                            ),
                            PieChartSectionData(
                                radius: 120.r,
                                value: 20,
                                color: AppColors.primary

                            ),
                            PieChartSectionData(
                                radius: 120.r,
                                value: 80,
                                color: AppColors.lightRedColor

                            )
                          ]
                      )),

                ),
                Container(
                  width: double.infinity,
                  height: 40.h,
                  margin: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child:CustomTabBar(labels: ["Expenses", "Income"]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: PercentBarWidget(
                      amount: "- 500",
                      category: 'Shopping',
                      percent: 0.8),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: PercentBarWidget(
                      amount: "- 400",
                      category: 'food',
                      percent: 0.5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: PercentBarWidget(
                      amount: "- 500",
                      category: 'subscription',
                      percent: 0.3),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }}
