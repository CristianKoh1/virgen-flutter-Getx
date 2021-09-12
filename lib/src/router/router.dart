import 'package:ciclicarestaurant/src/binding/bindings/bottomBarBinding.dart';
import 'package:ciclicarestaurant/src/binding/bindings/loginBinding.dart';
import 'package:ciclicarestaurant/src/binding/bindings/singUpBinding.dart';
import 'package:ciclicarestaurant/src/binding/bindings/splashBinding.dart';
import 'package:ciclicarestaurant/src/views/bottomBar/bottombar.dart';
import 'package:ciclicarestaurant/src/views/login.dart/login.dart';
import 'package:ciclicarestaurant/src/views/login.dart/singUp.dart';
import 'package:ciclicarestaurant/src/views/splash/splash.dart';
import 'package:get/get.dart';

class Routes {
  static final String splash = "/splash";
  static final String login = "/login";
  static final String singUp = "/singUp";
  static final String bottombar = "/bottombar";
}

class Pages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.bottombar,
        page: () => BottomBarPage(),
        binding: BottomBarBinding()),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.singUp,
      page: () => SingUp(),
      binding: SingUpBinding(),
    ),
  ];
}
