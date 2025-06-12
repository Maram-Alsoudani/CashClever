import 'package:CashClever/config/routes.dart';
import 'package:CashClever/core/cache/shared_preferences.dart';
import 'package:CashClever/core/components/custom_tab_bar.dart';
import 'package:CashClever/core/utils/colors.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/core/utils/images.dart';
import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/auth/data/models/user_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/my_custom_clipper.dart';
import '../widgets/transactionsItem.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
late UserDTO user;
  @override
  void initState() {
    super.initState();
    var prefsUser= SharedPrefs.getData(key: "LoggedInUser");
    if(prefsUser !=null){
      user= prefsUser;
    }

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                  Column(
                    children: [
                     SizedBox(height: 43,),
                      Text(
                        AppStrings.accountBalance,
                        style: context.bodyMedium.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: Text(
                          "${user.balance} EGP",
                          style: context.headlineLarge.copyWith(color: AppColors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 160.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: AppColors.green,
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
                                        color: AppColors.medGray,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${user.income}",
                                      style: context.bodyMedium.copyWith(
                                        color: AppColors.medGray,
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
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightRedColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 48.w,
                                  height: 48.h,
                                  child: Image.asset(AppImages.expenses),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.expenses,
                                      style: context.bodyMedium.copyWith(
                                        color: AppColors.medGray,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${user.expenses}",
                                      style: context.bodyMedium.copyWith(
                                        color: AppColors.medGray,
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
                    ],
                  )
              ],),
              SizedBox(height: 10,),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1, color: AppColors.medGray)
                    ),
                    child: CustomTabBar(
                        labels: [
                      AppStrings.today,
                      AppStrings.week,
                      AppStrings.month
                    ]),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15.sp, right: 15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.recentTransactions,
                          style: context.bodyMedium.copyWith(color: AppColors.medGray),),
                        TextButton(
                          onPressed: (){
                            context.go(AppRoutes.transactionTab);
                          } ,
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
                padding: EdgeInsets.zero,
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
    );
  }

}


