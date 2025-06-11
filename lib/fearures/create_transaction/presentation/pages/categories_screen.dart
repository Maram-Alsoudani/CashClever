import 'package:finsage/core/components/primary_button.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/fearures/create_transaction/presentation/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes.dart';
import '../../../../core/utils/colors.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> categories = [
    'Food',
    'Social',
    'Traffic',
    'Shopping',
    'Grocery',
    'Education',
    'Bills',
    'Rentals',
    'Medical',
    'Investments',
    'Gift',
    'Other'
  ];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Future.delayed(Duration(milliseconds: 100), () {
                          if (mounted) {
                            context.pop(categories[index]);
                          }
                        });
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: CategoryItem(
                        categoryName: categories[index],
                        clicked: selectedIndex == index,
                      ));
                }),
          ),
        ]),
      ),
    );
  }
}
