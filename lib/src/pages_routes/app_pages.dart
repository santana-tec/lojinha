import 'package:get/get.dart';
import 'package:lojinha/src/pages/auth/sign_up_screen.dart';
import 'package:lojinha/src/pages/auth/sing_in_screen.dart';
import 'package:lojinha/src/pages/base/base_screen.dart';
import 'package:lojinha/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PageRoutes.splashRoute,
    ),
    GetPage(
      page: () => const SignInScreen(),
      name: PageRoutes.signInRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PageRoutes.signUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PageRoutes.baseRoute,
    ),
  ];
}

abstract class PageRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
