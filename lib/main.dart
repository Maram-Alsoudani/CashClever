import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/calculator_cubit.dart';
import 'package:CashClever/fearures/create_transaction/presentation/manager/cubits/category_cubit.dart';
import 'package:CashClever/fearures/home/presentation/manager/cubit/home_cubit.dart';
import 'package:CashClever/fearures/transactions/presentation/manager/transactions_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';
import 'config/routes.dart';
import 'config/theming.dart';
import 'core/cache/shared_preferences.dart';
import 'core/dependency_injection.dart';
import 'fearures/create_transaction/presentation/manager/cubits/Create_transaction_cubit.dart';
import 'fearures/create_transaction/presentation/manager/cubits/date_cubit.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  SharedPrefs.init();

  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) =>getIt<HomeCubit>()
      ),
      BlocProvider(create: (_) =>getIt<TransactionsCubit>()
      ),

      BlocProvider(create: (_) =>getIt<CreateTransactionCubit>()),
      BlocProvider(
          create: (_) => CategoryCubit()),
      BlocProvider(
          create: (_) => DateCubit(),),
      BlocProvider(
          create: (_) => CalculatorCubit()),
    ], child: MyApp())

    // MyApp()

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.route,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
