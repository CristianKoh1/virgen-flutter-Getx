import 'package:ciclicarestaurant/src/dataSource/apiRepositoryImpl.dart';
import 'package:ciclicarestaurant/src/dataSource/localRepositoryImpl.dart';
import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl(),
        fenix: true);
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl(), fenix: true);
  }
}
