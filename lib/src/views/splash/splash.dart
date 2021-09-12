import 'package:ciclicarestaurant/src/controllers/splashController.dart';
import 'package:ciclicarestaurant/src/views/util/backSplash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SplashPage extends GetView<SplashController> {
  final SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackSplash(),
          Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 90,
                          width: 90,
                          child: RiveAnimation.asset(
                              'assets/animation/splash.riv')),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("CICLICA",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                letterSpacing: 2)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
