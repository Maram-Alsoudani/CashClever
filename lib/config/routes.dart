import 'package:CashClever/fearures/auth/presentation/pages/reset_password_screen.dart';
import 'package:CashClever/fearures/create_transaction/presentation/pages/categories_screen.dart';
import 'package:CashClever/fearures/create_transaction/presentation/pages/new_transaction_screen.dart';
import 'package:CashClever/fearures/auth/presentation/pages/login_screen.dart';
import 'package:CashClever/fearures/main_layout/presentation/pages/main_screen.dart';
import 'package:CashClever/fearures/auth/presentation/pages/register_screen.dart';
import 'package:CashClever/fearures/transactions/presentation/pages/transaction_tab.dart';
import 'package:go_router/go_router.dart';

import '../fearures/splash/presentation/pages/splash_screen.dart';
class AppRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String mainScreen = '/main';
  static const String newTransaction = '/newTransaction';
  static const String transactionTab = '/transactionTab';
  static const String newTransactionScreen = '/newTransactionScreen';
  static const String categoriesScreen = '/categoriesScreen';
  static const String resetPassScreen = '/resetPassScreen';




  static final GoRouter router = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: mainScreen,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        path: newTransaction,
        builder: (context, state) => NewTransactionScreen(),
      ),
      GoRoute(
        path: transactionTab,
        builder: (context, state) => TransactionTab(),
      ),
      GoRoute(
        path: categoriesScreen,
        builder: (context, state) => CategoriesScreen(),
      ),
      GoRoute(
        path: resetPassScreen,
        builder: (context, state) => ResetPassScreen(),
      ),
  //     GoRoute(
  //       path:'$newTransactionScreen/:selectedCategory' ,
  //       builder: (context, state){
  //         final selectedCategory= state.pathParameters['selectedCategory'];
  //         return NewTransactionScreen(selectedCategory: selectedCategory);
  // } ,
  //     ),
    ],
  );
}
