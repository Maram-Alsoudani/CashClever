import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogUtils{
  static Future<String?> showInputDialog({
    required BuildContext context,
    required String title,
    String? posActionNamed,
    Function? posAction,
    String? negActionNamed,
    Function? negAction,
  }) {
    TextEditingController inputController = TextEditingController();
    List<Widget> actions = [];
    if (negActionNamed != null) {
      actions.add(
        TextButton(
          onPressed: () {
            context.pop(); // Return user input
            negAction?.call();
          },
          child: Text(negActionNamed, style: context.bodySmall,),
        ),
      );
    }
    if (posActionNamed != null) {
      actions.add(
        TextButton(
          onPressed: () {
        if(inputController.text.isNotEmpty){
          context.pop(inputController.text); // Return user input
          posAction?.call();
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You should enter the name of category first!'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }

          },
          child: Text(posActionNamed, style: context.bodySmall.copyWith(color: AppColors.lightBlue),),
        ),
      );
    }


    return showDialog<String>(

      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          titleTextStyle: context.bodyLarge,
          title: Text(title),
          content: TextFormField(

            cursorColor: AppColors.medGray,
            enabled: true,
            decoration: InputDecoration(
              focusedBorder:UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.black)
              )
            ),
            controller: inputController,
          ),
          actions: actions,
        );
      },
    );
  }

}