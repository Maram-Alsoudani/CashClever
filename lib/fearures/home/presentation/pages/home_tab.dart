import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/transactionsItem.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "MONDAY 9",
                            style: context.bodyMedium,
                          ),
                          Text("NOVEMBER"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(40.r),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 24.r,
                              child: Image(
                                image: AssetImage(AppImages.profileIcon),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                SizedBox(height: 40.h),
                Text(
                  AppStrings.accountBalance,
                  style: context.bodyMedium.copyWith(
                    color: AppColors.medGray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.sp),
                  child: Text(
                    "500.0 EGP",
                    style: context.headlineLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 160.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 48.w,
                            height: 48.h,
                            child: Image.asset(AppImages.income),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.income,
                                style: context.bodyMedium.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "2500",
                                style: context.bodyMedium.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 160.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppColors.lightRedColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Image.asset(AppImages.expenses),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.expenses,
                                style: context.bodyMedium.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "2500",
                                style: context.bodyMedium.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: AppColors.black)
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        labelPadding: EdgeInsets.all(0.sp),
                        labelStyle: context.bodySmall.copyWith(color: AppColors.black),
                        labelColor: AppColors.white,
                        indicator: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        tabs:  [
                          Center(child: Tab(text: AppStrings.today)),
                          Center(child: Tab(text: AppStrings.week)),
                          Center(child: Tab(text: AppStrings.month)),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 20.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.recentTransactions,
                            style: context.bodyMedium.copyWith(color: AppColors.medGray),),
                          TextButton(
                            onPressed: (){} ,
                            child: Text(
                                AppStrings.viewAll,
                                style: context.bodySmall.copyWith(
                                    color: AppColors.primary
                                )
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index){
                      return TransactionsItem(
                        amount: "1500",
                        type: "income",

                      ) ;
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

