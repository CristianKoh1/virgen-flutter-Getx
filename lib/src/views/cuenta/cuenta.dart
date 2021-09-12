import 'package:ciclicarestaurant/src/controllers/cuentaController.dart';
import 'package:ciclicarestaurant/src/views/util/networkImageError.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CuentaPage extends GetView<CuentaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(titleSpacing: 2, leading: _leading(), title: _titulo()),
        body: SafeArea(
            child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.black,
              ),
              title: Text("Cerrar sesion",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {
                controller.salir();
              },
            ),
          ],
        )));
  }

  Obx _titulo() {
    return Obx(() => Text(
          controller.name.toString(),
          style: TextStyle(fontSize: 15, color: Colors.black87),
        ));
  }

  Padding _leading() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundImage: networkImageError(null,
            "https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg"),
      ),
    );
  }
}
