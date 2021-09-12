import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String baseUrlRestaurante = "https://ciclica.app/img_restaurant/";
const String baseUrlEnvases = "https://ciclica.app/img_envases/";
const String baseUrlProducto = "https://ciclica.app/img_products/";
const String baseUrlCategoria = "https://ciclica.app/img_category/";
const String baseurl = "https://ciclica.app/api/v1/restaurant";
void snackBar(String titulo, String detalle) {
  Get.snackbar(titulo, detalle,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10));
}

const String predeterminada = "assets/images/logo.png";
const String predeterminadaEnvace = "assets/images/envasePredeterminado.jpeg";
const String predeterminadaProducto = "assets/images/envasePredeterminado.jpeg";
