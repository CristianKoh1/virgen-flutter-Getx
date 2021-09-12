import 'package:ciclicarestaurant/src/controllers/singUpController.dart';
import 'package:get/get.dart';

class SingUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SingUpController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find()));
  }
}
