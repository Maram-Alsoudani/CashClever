import 'package:finsage/config/routes.dart';
import 'package:finsage/config/theming.dart';
import 'package:finsage/core/cache/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/dependency_injection.dart';


void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
 SharedPrefs.init();
  await Firebase.initializeApp(
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child){
        return MaterialApp.router(
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        );
      },
    ) ;
  }
}



