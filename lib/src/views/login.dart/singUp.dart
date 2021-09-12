import 'package:ciclicarestaurant/src/controllers/singUpController.dart';
import 'package:ciclicarestaurant/src/views/util/BackLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class SingUp extends GetWidget<SingUpController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /* resizeToAvoidBottomPadding: false, */
      body: Stack(
        children: <Widget>[
          BackLogin(),
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buttonAtras(context),
              Flexible(flex: 1, child: blockCenter(size))
            ],
          ))
        ],
      ),
    );
  }

  Widget buttonAtras(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            Get.back();
          }),
    );
  }

  Widget blockCenter(Size size) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsetsDirectional.only(bottom: 50),
        width: size.width * .76,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            titulo(),
            alerta(),
            _input(
                icon: Icons.person,
                label: "Nombre",
                controller: controller.name),
            _input(
                icon: Icons.phone_android_rounded,
                label: "Telefono",
                controller: controller.telefono),
            _input(
                icon: Icons.mail_rounded,
                label: "Corrreo",
                controller: controller.correo),
            _input(
                icon: Icons.lock_open_sharp,
                label: "Contraseña",
                controller: controller.password,
                obscure: true),
            botonIngresar(),
            recuperarcontrasenia()
          ],
        ),
      ),
    );
  }

  Container _input(
      {required String label,
      TextInputType type = TextInputType.text,
      required IconData icon,
      bool obscure = false,
      required TextEditingController controller,
      bool enable = true}) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: enable ? 4 : 1,
        child: TextField(
          minLines: 1,
          maxLines: 1,
          keyboardType: type,
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 6, bottom: 5),
              labelText: label,
              border: InputBorder.none,
              prefixIcon: Icon(icon)),
          enabled: enable,
        ),
      ),
    );
  }

  Widget titulo() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: double.infinity,
      child: Text(
        'Registrate',
        style: TextStyle(
            color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget recordarContrasenia() {
    return Container(
      child: Obx(() => SwitchListTile(
          activeColor: Colors.orange[100],
          contentPadding: EdgeInsetsDirectional.only(end: 0),
          title: Text(
            'RECORDAR CONTRASEÑA',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.grey[300]),
          ),
          value: controller.recordarContrasenia.value,
          onChanged: (bool e) {
            controller.setRecordarContrasenia(e);
          })),
    );
  }

  Widget botonIngresar() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child:
          Container() /* BotonRedondo(
        text: 'Registrar',
        color: Colors.yellow[600],
        press: () {
          controller.postSingUp();
        },
      ) */
      ,
    );
  }

  Widget recuperarcontrasenia() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 17),
      child: GestureDetector(
        child: Text(
          '¿SE TE OLVIDO TU CONTRASEÑA?',
          style: TextStyle(color: Colors.grey[300], fontSize: 10),
        ),
      ),
    );
  }

  Widget alerta() {
    return Visibility(
      visible: false,
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 10),
        child: Text(
          'Usuario o contraseña incorrecta',
          style: TextStyle(fontSize: 16, color: Colors.redAccent),
        ),
      ),
    );
  }
}
