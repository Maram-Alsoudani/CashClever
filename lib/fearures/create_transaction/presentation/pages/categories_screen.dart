import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/category_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';
import '../manager/states/category_states.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit= context.read<CategoryCubit>();

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state){

        return Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                )),
            title: Text(
              "Categories",
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
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1, crossAxisSpacing: 5),
                    itemCount: cubit.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                           cubit.selectCategory(index);
                           Navigator.pop(context);
                          },
                          child: CategoryItem(
                            categoryName: cubit.categories[index],
                            clicked: cubit.selectedIndex == index,
                          ));
                    }),
              ),
            ]),
          ),
        );
      },

    );
  }
}