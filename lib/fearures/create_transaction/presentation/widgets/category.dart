import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/Create_transaction_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/category_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/states/category_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';


class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state){
        final selectedCategory = state is CategorySelectedState ? state.selectedCategory : null;
        if (state is CategorySelectedState) {
          context.read<CreateTransactionCubit>().updateCategory(state.selectedCategory);
        }
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.category,
                style:
                context.bodyMedium.copyWith(color: AppColors.black),
              ),
              Row(
                children: [
                  TextButton(
                      child: Text(selectedCategory ?? "CHOOSE",
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w300)),
                      onPressed: () async {
                       await Navigator.pushNamed(context,AppRoutes.categoriesScreen);
                      }
                      ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20,
                  )
                ],
              )
            ],
          ),
        );
      },

    );
  }
}