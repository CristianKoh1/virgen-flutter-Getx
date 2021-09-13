import 'package:ciclicarestaurant/src/models/envasesResponse.dart';
import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:get/get.dart';

class EnvasesController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  EnvasesResponse? envases;
  RxBool cargando = true.obs;
  EnvasesController(
      {required this.apiRepositoryInterface,
      required this.localRepositoryInterface});

  @override
  void onInit() {
    request();
    super.onInit();
  }

  Future<void> request() async {
    try {
      String _token = await localRepositoryInterface.getToken();
      envases = await apiRepositoryInterface.getEnvases(_token);
      cargando.value = false;
      cargando.refresh();
    } catch (e) {
      Get.snackbar("Error", "Error en la conexion.");
    }
  }
}
