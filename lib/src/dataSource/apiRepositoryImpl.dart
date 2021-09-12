import 'dart:convert';

import 'package:ciclicarestaurant/src/exceptions/authException.dart';

import 'package:ciclicarestaurant/src/models/login.dart';
import 'package:ciclicarestaurant/src/models/singUpRequest.dart';
import 'package:ciclicarestaurant/src/repository/apiRepositoryInterface.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  Duration _duration = Duration(seconds: 2);

  @override
  Future<void> logout(String _tokenFirebase, String token) async {
    var data = jsonEncode({
      'tokenFirebase': _tokenFirebase,
    });
    try {
      Uri url = Uri.parse(baseurl + "/logout");
      await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
          },
          body: data);
    } catch (e) {}
  }

  @override
  Future<LoginResponse> singUp(SingUpRequest singUp) async {
    try {
      Uri url = Uri.parse(baseurl + "/register");
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: singUpRequestToJson(singUp));

      if (response.statusCode == 200 || response.statusCode == 401) {
        return loginResponseFromJson(response.body);
      }
      throw AuthEception();
    } catch (e) {
      throw AuthEception();
    }
  }

  @override
  Future<LoginResponse?> login(LoginRequest login) async {
    try {
      var url = Uri.parse(baseurl + "/login");
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: loginRequestToJson(login));
      if (response.statusCode == 200) {
        LoginResponse responseLogin = loginResponseFromJson(response.body);
        return responseLogin;
      }
      if (response.statusCode == 401) {
        return null;
      }
      throw AuthEception();
    } catch (e) {
      throw AuthEception();
    }
  }
}
