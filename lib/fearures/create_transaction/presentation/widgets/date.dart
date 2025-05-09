import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedSelectedDate =
    DateFormat('dd-MM-yyyy – hh:mm').format(selectedDate);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () {
          showCalender();
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
              formattedSelectedDate,
              style: context.bodySmall
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
  void showCalender() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }
}
