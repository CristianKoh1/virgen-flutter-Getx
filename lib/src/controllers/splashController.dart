import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/router/router.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;

  SplashController(
      {required this.apiRepositoryInterface,
      required this.localRepositoryInterface});

  @override
  void onReady() async {
    super.onReady();
    String? token = await localRepositoryInterface.getToken();
    /*  LoginRequest? login = await localRepositoryInterface.getLogin(); */

    if (token == null || token == "") {
      Get.offAllNamed(Routes.login);
    } else {
      bool hasExpired = JwtDecoder.isExpired(token);
      if (hasExpired) {
        Get.offAllNamed(
          Routes.login,
        );
      } else {
        Get.offAllNamed(Routes.bottombar);
      }
    }
  }
}
