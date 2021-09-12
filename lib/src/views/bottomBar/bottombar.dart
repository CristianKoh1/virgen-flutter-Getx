import 'package:ciclicarestaurant/src/controllers/bottomBarController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class BottomBarPage extends GetView<BottomBarController> {
  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return WillPopScope(
      onWillPop: () async {
        controller.setPage(controller.tabIndexAfter.toInt());
        return false;
      },
      child: Obx(() {
        if (controller.cargando.isTrue) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Cargando..."),
                  Container(
                      height: 150,
                      width: 150,
                      child:
                          RiveAnimation.asset('assets/animation/brithing.riv')),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(child: Obx(() {
              return Stack(
                children: [
                  IndexedStack(
                      index: controller.tabIndex.toInt(),
                      children: controller.pageList),
                  /* ButtonVerCarrito() */
                ],
              );
            })),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              /* notchMargin: 9, */
              child: _botones(controller),
            ),
          );
        }
      }),
    );
  }

  Container _contador(bool _bool) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), color: Colors.red),
      height: _bool ? 11 : 15,
      width: _bool ? 11 : 15,
      margin: EdgeInsets.only(left: _bool ? 26 : 36, top: _bool ? 10 : 25),
      child: Text(
        controller.cartProducts.toString(),
        style: TextStyle(fontSize: _bool ? 5 : 8),
      ),
    );
  }

  Container _botones(BottomBarController controller) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: MaterialButton(
              minWidth: 10,
              onPressed: () {
                controller.setPage(0);
              },
              child: Obx(() {
                final Color _color = controller.tabIndex.toInt() == 0
                    ? Colors.black
                    : Colors.black45;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark, size: 26, color: _color),
                    Text(
                      "Pedidos",
                      style: TextStyle(fontSize: 10, color: _color),
                    )
                  ],
                );
              }),
            ),
          ),
          Expanded(
            child: MaterialButton(
              minWidth: 10,
              onPressed: () {
                controller.setPage(1);
              },
              child: Obx(() {
                final Color _color = controller.tabIndex.toInt() == 1
                    ? Colors.black
                    : Colors.black45;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restaurant_rounded, color: _color),
                    Text(
                      "Envaces",
                      style: TextStyle(fontSize: 10, color: _color),
                    )
                  ],
                );
              }),
            ),
          ),
          Expanded(
            child: MaterialButton(
              minWidth: 10,
              onPressed: () {
                controller.setPage(2);
              },
              child: Obx(() {
                final Color _color = controller.tabIndex.toInt() == 2
                    ? Colors.black
                    : Colors.black45;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: _color),
                    Text(
                      "Cuenta",
                      style: TextStyle(fontSize: 10, color: _color),
                    )
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
