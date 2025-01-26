import 'package:finsage/core/components/custom_tab_bar.dart';
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
                          "500.0 EGP",
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
                                      "2500",
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
                                      "2500",
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

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
      size.width / 6,
      size.height - 40,
      size.width / 3,
      size.height - 20,
    );
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      2 * size.width / 3,
      size.height - 20,
    );
    path.quadraticBezierTo(
      5 * size.width / 6,
      size.height - 40,
      size.width,
      size.height - 20,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // No need to reclip in this example
  }
}

