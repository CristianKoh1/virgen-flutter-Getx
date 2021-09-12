import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciclicarestaurant/src/constants.dart';
import 'package:flutter/material.dart';

ImageProvider networkImageError(String? _baseurl, String? _imagen,
    {String predeterminado = predeterminada}) {
  String _temp;
  if (_imagen == null || _imagen == "") {
    return AssetImage(predeterminado);
  } else {
    _temp = _baseurl != null ? _baseurl : "";
    return CachedNetworkImageProvider(_temp + _imagen);
  }
}
