import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/views/cuenta/cuenta.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  final Rx<int> tabIndex = 0.obs;
  int tabIndexAfter = 0;
  final Rx<int> cartProducts = 0.obs;
  RxBool writing = false.obs;
  RxBool cargando = true.obs;
/*   Conf? configuracionInicial;
  Rx<Direcciones>? direccion; */
  List<Widget> pageList = [];

  BottomBarController(
      {required this.apiRepositoryInterface,
      required this.localRepositoryInterface});

  @override
  void onInit() async {
    /*   final InicioController inicioController = Get.find();
    await inicioController.inicio();
    final PedidosController pedidosController = Get.find();
    await pedidosController.inicio();
    String? token = await localRepositoryInterface.getToken();
    if (token != null) {
      try {
        configuracionInicial = await apiRepositoryInterface.getConf(token);
        Direccion _direcciones =
            await apiRepositoryInterface.getDirecciones(token);
        if (_direcciones.direcciones.length == 0) {
          Get.offAllNamed(Routes.map);
        } else {
          _direcciones.direcciones.forEach((element) {
            if (element.selected == 1) {
              direccion = element.obs;
            }
          });
         */
    pageList += [
      Container(),
      Container(),
      CuentaPage(),
    ];
    cargando(false);
    /*  
        }
      } catch (e) {
        Get.offAllNamed(Routes.login);
        Get.snackbar("Error", "Vuelva a intentar mas tarde.",
            duration: Duration(seconds: 30), margin: EdgeInsets.only(top: 5));
      }
    } */
    super.onInit();
  }

  void setPage(int index) {
    tabIndexAfter = tabIndex.toInt();

    tabIndex(index);
    /* setWriting(true); */
  }

  void setCartProducts(int val) {
    cartProducts(val);
  }

  /*  void setNewUbicacion(Direcciones _direccion) {
    direccion!(_direccion);
  } */

  void searchProduct(String query) {
    /*    final CustomSearchProductController customSearchProductController =
        Get.find();
    customSearchProductController.searchProduct(query); */
  }

  /*  void addHistory(Producto productoSeleccionado) {
    final HomePageController homePageController = Get.find();
    homePageController.addHistory(productoSeleccionado);
  } */

/*   List<Producto> historial() {
    final HomePageController homePageController = Get.find();
    return homePageController.historial.toList();
  } */
/* 
  Future<List<Producto>> searchResults(String query) async {
    final HomePageController homePageController = Get.find();
    List<Producto> _productos = await homePageController.searchResults(query);
    return _productos;
  } */

  void setWriting(bool _bool) {
    writing(_bool);
  }
}
