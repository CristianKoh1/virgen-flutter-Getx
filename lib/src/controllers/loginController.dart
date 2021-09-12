import 'package:ciclicarestaurant/src/models/login.dart';
import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoginController extends GetxController {
  late RiveAnimationController riveController;
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  SMITrigger? bump;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  RxBool recordar = true.obs;
  LoginController(
      {required this.apiRepositoryInterface,
      required this.localRepositoryInterface});
  @override
  void onInit() async {
    /*  LoginRequest? _login = await localRepositoryInterface.getLogin();
    String? _email = _login?.email;
    String? _password = _login?.password;
    if (_login != null && _email != null && _password != null) {
      email.text = _email;
      password.text = _password;
    } */
    email.text = "superuser@example.com";
    password.text = "1234567890";
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> entrar() async {
    String? _tokenFireBase = await localRepositoryInterface.getTokenFirebase();
    LoginRequest _login = LoginRequest(
        email: email.text,
        password: password.text,
        tokenFirebase: _tokenFireBase);

    try {
      LoginResponse? _loginResponse =
          await apiRepositoryInterface.login(_login);
      if (_loginResponse != null) {
        localRepositoryInterface.saveToken(_loginResponse.token.token);
        localRepositoryInterface.saveName(_loginResponse.user.name);
        if (recordar.isTrue) {
          localRepositoryInterface.saveLogin(_login);
        }
        email.text = "";
        password.text = "";
        Get.toNamed(Routes.bottombar);
      } else {
        Get.snackbar("Error", "Usuario o contraseña incorrato.");
      }
    } catch (e) {
      Get.snackbar("Error", "Error con la conexion.");
    }
  }

  void onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'Idle');
    if (controller != null) {
      artboard.addController(controller);
      bump = controller.findInput<bool>('Idle') as SMITrigger;
    }
  }

  void setRecordarContrasenia(bool _recordar) {
    recordar(_recordar);
  }
}
