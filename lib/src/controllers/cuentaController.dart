import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/router/router.dart';
import 'package:get/get.dart';

class CuentaController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  RxString name = "Sin nombre".obs;
  CuentaController(
      {required this.apiRepositoryInterface,
      required this.localRepositoryInterface});

  @override
  void onInit() async {
    String? _name = await localRepositoryInterface.getName();
    if (_name != null) {
      name.value = _name;
    }
    super.onInit();
  }

  Future<void> salir() async {
    String? _tokenFirebase = await localRepositoryInterface.getTokenFirebase();
/*     LoginRequest? _login = await localRepositoryInterface.getLogin(); */
    String? _token = await localRepositoryInterface.getToken();
    await localRepositoryInterface.clearAllData();
    if (_tokenFirebase != null && _token != null) {
      /*     if (_login != null) {
        await localRepositoryInterface.saveLogin(_login);
      } */
      await apiRepositoryInterface.logout(_tokenFirebase, _token);
      await localRepositoryInterface.saveTokenFirebase(_tokenFirebase);
    }
    Get.offAllNamed(Routes.login);
  }
}
