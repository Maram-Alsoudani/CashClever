import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:finsage/fearures/home/presentation/pages/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../budget/presentation/pages/budget_tab.dart';
import '../../../settings/presentation/pages/settings_tab.dart';
import '../../../transactions/presentation/pages/transaction_tab.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), TransactionTab(), BudgetTab(), SettingsTab()];

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40.sp,
          color: AppColors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => onItemTapped(0),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.homeIcon),
                      color: selectedIndex == 0
                          ? AppColors.lightBlue
                          : AppColors.medGray,
                    ),
                    Text(AppStrings.home,
                        style: context.bodySmall.copyWith(
                          fontSize: 13.sp,
                          color: selectedIndex == 0
                              ? AppColors.lightBlue
                              : AppColors.medGray,
                        ))
                  ],
                )),
            IconButton(
                onPressed: () => onItemTapped(1),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.transactionIcon),
                      color: selectedIndex == 1
                          ? AppColors.lightBlue
                          : AppColors.medGray,
                    ),
                    Text(AppStrings.transactions,
                        style: context.bodySmall.copyWith(
                          fontSize: 13.sp,
                          color: selectedIndex == 1
                              ? AppColors.lightBlue
                              : AppColors.medGray,
                        ))
                  ],
                )),
            SizedBox(width: 40.w),
            IconButton(
                onPressed: () => onItemTapped(2),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.budgetIcon),
                      color: selectedIndex == 2
                          ? AppColors.lightBlue
                          : AppColors.medGray,
                    ),
                    Text(AppStrings.budget,
                        style: context.bodySmall.copyWith(
                          fontSize: 13.sp,
                          color: selectedIndex == 2
                              ? AppColors.lightBlue
                              : AppColors.medGray,
                        )),
                  ],
                )),
            IconButton(
                onPressed: () => onItemTapped(3),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 32,
                      color: selectedIndex == 3
                          ? AppColors.lightBlue
                          : AppColors.medGray,
                    ),
                    Text(AppStrings.settings,
                        style: context.bodySmall.copyWith(
                          fontSize: 13.sp,
                          color: selectedIndex == 3
                              ? AppColors.lightBlue
                              : AppColors.medGray,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
