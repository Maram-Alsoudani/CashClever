import 'package:CashClever/config/routes.dart';
import 'package:CashClever/core/components/custom_tab_bar.dart';
import 'package:CashClever/core/components/primary_button.dart';
import 'package:CashClever/core/utils/colors.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/amount.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/calculator_widget.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/date.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/category.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/divider_widget.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({super.key});
  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  String amount='0.0';
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.go(AppRoutes.mainScreen);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
          title: Text(
            AppStrings.newTransaction,
            style: context.headlineMedium.copyWith(color: AppColors.white),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(
              bottom: 60.sp, left: 20.sp, right: 20.sp, top: 20.sp),
          padding: EdgeInsets.all(20.sp),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTabBar(labels: [AppStrings.income, AppStrings.expenses]),
              Amount(amount: amount, onClicked: showCalculator),
              DividerWidget(),
              Category() ,
              DividerWidget(),
              Date(),
              DividerWidget(),
              Note(),
              // save button
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                child: PrimaryButton(
                  label: Text(AppStrings.save),
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: WidgetStatePropertyAll(AppColors.orange),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showCalculator() async {
    final result= await showModalBottomSheet(
        context: context,
        builder: (_) => CalculatorWidget(output: amount,),
    );

    if(result != null){
      setState(() {
        amount = result;
      });
    }
  }
}
