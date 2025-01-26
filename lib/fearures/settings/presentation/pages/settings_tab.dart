import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';
import '../widgets/setting_item.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.settings,
          style: context.headlineMedium.copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.sp),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGray,
                    spreadRadius: 2.r,
                    blurRadius: 9.r,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: SwitchListTile(
                  secondary: Image(
                    image: AssetImage(
                      AppImages.mode,
                    ),
                    width: 60,
                    height: 60,
                    color: AppColors.orange,
                  ),
                  title: Text(
                    AppStrings.darkMode,
                    style: context.bodyMedium,
                  ),
                  value: isDark,
                  onChanged: (value) {
                    setState(() {
                      isDark = !isDark;
                    });
                  }),
            ),
            InkWell(
              child: SettingsItem(
                  imagePath: AppImages.account, text: AppStrings.account),
            ),
            InkWell(
              child: SettingsItem(
                  imagePath: AppImages.notification,
                  text: AppStrings.notification),
            ),
            InkWell(
              child: SettingsItem(
                  imagePath: AppImages.language,
                  text: AppStrings.language),
            ),
            TextButton(onPressed: (){},
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Logout", style: context.bodyMedium.copyWith(color: AppColors.orange),),
                )
            )

          ],
        ),
      ),
    );
  }
}
