import 'package:CashClever/core/utils/colors.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/core/utils/images.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  String categoryName;
  bool clicked;
   CategoryItem({super.key, required this.categoryName, required this.clicked });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.clicked?AppColors.orange: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: AppColors.gray)
        ),
      child: Column(
    children: [
        Image(image: AssetImage("assets/images/${widget.categoryName.toLowerCase()}.png",), width: 50,height: 50,),
    Text(widget.categoryName, style: context.bodyMedium.copyWith(fontSize: 15),),
        ],
    ));


  }
}
