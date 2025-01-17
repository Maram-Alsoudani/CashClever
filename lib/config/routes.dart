import 'package:finsage/fearures/login/presentation/pages/login_screen.dart';
import 'package:finsage/fearures/main_layout/presentation/pages/main_screen.dart';
import 'package:finsage/fearures/register/presentation/pages/register_screen.dart';
import 'package:go_router/go_router.dart';

import '../fearures/splash/presentation/pages/splash_screen.dart';
class AppRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String mainScreen = '/main';


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
    ],
  );
}
