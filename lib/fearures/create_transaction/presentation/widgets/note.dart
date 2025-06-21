import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/Create_transaction_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/validators.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';

class Note extends StatelessWidget {
   Note({super.key});
  @override
  Widget build(BuildContext context) {
    final CreateTransactionCubit cubit= context.read<CreateTransactionCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.notes,
            style:
            context.bodyMedium.copyWith(color: AppColors.black),
          ),
          CustomTextFormField(
            hint: "add a description",
            validator: (val) => AppValidators.validateUsername(val),
            controller: cubit.noteController,
            enabledBorderColor: AppColors.darkGray,
            borderRadius: BorderRadius.circular(10),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
          )
        ],
      ),
    );
  }
}
