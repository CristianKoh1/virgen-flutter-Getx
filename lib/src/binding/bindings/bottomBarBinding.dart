import 'package:ciclicarestaurant/src/controllers/bottomBarController.dart';
import 'package:ciclicarestaurant/src/controllers/cuentaController.dart';
import 'package:get/get.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find()));
    Get.lazyPut(() => CuentaController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find()));
  }
}
