import 'package:CashClever/fearures/auth/presentation/pages/reset_password_screen.dart';
import 'package:CashClever/fearures/create_transaction/presentation/pages/categories_screen.dart';
import 'package:CashClever/fearures/auth/presentation/pages/login_screen.dart';
import 'package:CashClever/fearures/create_transaction/presentation/pages/create_transaction_screen.dart';
import 'package:CashClever/fearures/main_layout/presentation/pages/main_screen.dart';
import 'package:CashClever/fearures/auth/presentation/pages/register_screen.dart';
import 'package:CashClever/fearures/transactions/presentation/pages/transaction_tab.dart';
import 'package:flutter/cupertino.dart';

import '../fearures/splash/presentation/pages/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> route = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) =>  LoginScreen(),
    createTransactionScreen: (context) =>  CreateTransactionScreen(),
    registerScreen: (context) =>  RegisterScreen(),
    mainScreen: (context) =>  MainScreen(),
    transactionTab: (context) => const TransactionTab(),
    categoriesScreen: (context) =>  CategoriesScreen(),
    resetPassScreen: (context) =>  ResetPassScreen(),


  };

  static const String splashScreen = 'splash';
  static const String loginScreen = 'login';
  static const String registerScreen = 'register';
  static const String createTransactionScreen = 'createTransactionScreen';
  static const String mainScreen = 'main';
  static const String newTransaction = 'newTransaction';
  static const String transactionTab = 'transactionTab';
  static const String categoriesScreen = 'categoriesScreen';
  static const String resetPassScreen = 'resetPassScreen';

}