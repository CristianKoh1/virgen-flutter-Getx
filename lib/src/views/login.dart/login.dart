import 'package:ciclicarestaurant/src/controllers/loginController.dart';
import 'package:ciclicarestaurant/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.singUp);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 11),
                      child: showFab
                          ? Text(
                              "Registrarme",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          : Container(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: size.width * .6,
                    height: size.width * .6,
                    child: CircleAvatar(
                      child: Text(
                        "CICLICA",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  )
                  /* Container(
                      height: 250,
                      width: 250,
                      child:
                          RiveAnimation.asset(
                        'assets/animation/oso2.riv',
                        fit: BoxFit.cover,
                        onInit: (Artboard artboard) {
                          controller.onRiveInit(artboard);
                        },
                      )) */
                  ,
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      padding: EdgeInsets.all(10),
                      width: size.width * .8,
                      child: Column(
                        children: [
                          TextField(
                            controller: controller.email,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                fillColor: Colors.black12,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                hintText: "Nombre de Usuario"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: controller.password,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                fillColor: Colors.black12,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                hintText: "Contraseña"),
                          ),
                          recordarContrasenia(),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.entrar();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text("Entrar"),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          recuperarcontrasenia()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    )));
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
          value: controller.recordar.value,
          onChanged: (bool e) {
            controller.setRecordarContrasenia(e);
          })),
    );
  }

  Widget recuperarcontrasenia() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 2),
      child: GestureDetector(
        child: Text(
          '¿SE TE OLVIDO TU CONTRASEÑA?',
          style: TextStyle(color: Colors.grey[300], fontSize: 10),
        ),
      ),
    );
  }
}
