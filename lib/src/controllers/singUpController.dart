import 'package:ciclicarestaurant/src/models/login.dart';
import 'package:ciclicarestaurant/src/models/singUpRequest.dart';
import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  TextEditingController name = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  Rx<bool> recordarContrasenia = true.obs;
  SingUpController(
      {required this.apiRepositoryInterface,
      required this.localRepositoryInterface});
  @override
  void onClose() {
    name.dispose();
    correo.dispose();
    telefono.dispose();
    password.dispose();
    password2.dispose();
    super.onClose();
  }

  void setRecordarContrasenia(bool recordar) {
    recordarContrasenia(recordar);
  }

  Future<void> postSingUp() async {
    final tokenFirebase = await localRepositoryInterface.getTokenFirebase();
    final SingUpRequest _singUp = SingUpRequest(
      email: correo.text,
      name: name.text,
      password: password.text,
      /* phone: telefono.text, */
      /* tokenFirebase: tokenFirebase */
    );
    try {
      final LoginRequest _loginRequest =
          LoginRequest(email: correo.text, password: password.text);
      final LoginResponse loginResponse =
          await apiRepositoryInterface.singUp(_singUp);
      if (loginResponse.success) {
        await localRepositoryInterface.saveToken(loginResponse.token.token);
        if (recordarContrasenia.value) {
          await localRepositoryInterface.saveLogin(_loginRequest);
        }
        ingresar();
      } else {
        /* String mensaje = textoError(loginResponse);
        Get.snackbar("Error", mensaje); */
        Get.snackbar("Error", "Autentificacion incorrecta.");
      }
    } catch (e) {
      Get.snackbar("Error", "Autentificacion incorrecta.");
    }
  }

  void ingresar() {
    Get.toNamed(Routes.bottombar);
  }
}
