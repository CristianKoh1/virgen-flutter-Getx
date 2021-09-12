import 'package:ciclicarestaurant/src/controllers/splashController.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find()));
  }
}