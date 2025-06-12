import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                    final result = await context
                        .push<String?>(AppRoutes.categoriesScreen);
                    if (result != null) {
                      setState(() {
                        selectedCategory = result;
                      });
                    }
                  }),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
