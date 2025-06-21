import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/Create_transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> labels;
  final Color? indicatorColor;

  const CustomTabBar({super.key, required this.labels, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index){
        context.read<CreateTransactionCubit>().getType(index);
      },
      dividerColor: Colors.transparent,
      labelPadding: EdgeInsets.all(0.sp),
      labelStyle: context.bodySmall.copyWith(color: AppColors.black),
      labelColor: AppColors.white,
      indicator: BoxDecoration(
        color: indicatorColor ?? AppColors.lightBlue,
        borderRadius: BorderRadius.circular(30.r),
      ),
      tabs: labels.map((label) {
        return Center(child: Tab(text: label));
      }).toList(),
    );
  }

  printTheIndext(int initialIndex) {

  }
}
