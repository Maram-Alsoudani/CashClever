import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.black,
      thickness: 0.7,
    );
  }
}
