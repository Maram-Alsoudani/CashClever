import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/Create_transaction_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/date_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/states/date_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {


  @override
  Widget build(BuildContext context) {
    final cubit= context.read<DateCubit>();
    return BlocBuilder<DateCubit, DateState>(
        builder: (context, state){
          DateTime dateTime = state is DateUpdatedState?state.updatedDate: DateTime.now();
          if(state is DateUpdatedState){
            context.read<CreateTransactionCubit>().updateDate(state.updatedDate);
          }
          String formattedDate=  DateFormat('dd-MM-yyyy – hh:mm').format(dateTime);


          return Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: InkWell(
            onTap: (){
              _showCalendar(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.date,
                  style:
                  context.bodyMedium.copyWith(color: AppColors.black),
                ),
                Text(
                  formattedDate,
                  style: context.bodySmall
                      .copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
  void _showCalendar(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      context.read<DateCubit>().updateDate(selectedDate);
    }
  }}
