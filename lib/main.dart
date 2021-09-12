import 'package:ciclicarestaurant/src/binding/mainBindinf.dart';
import 'package:ciclicarestaurant/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ciclica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      /* defaultTransition: Transition.fade, */
      initialRoute: Routes.splash,
      initialBinding: MainBinding(),
      getPages: Pages.pages,
    );
  }
}
