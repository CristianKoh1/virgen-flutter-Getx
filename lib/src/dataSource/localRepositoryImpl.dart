import 'package:ciclicarestaurant/src/models/login.dart';
import 'package:ciclicarestaurant/src/repository/localRepositoryInterface.dart';
import 'package:ciclicarestaurant/src/router/router.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* 
const _user = "USER";
const _productsToCart = "CARD";
const _tokenFirebase = "TOKENFIREBASE";
const _ultimaDireccion = "ULTIMADIRECCION"; */
const _login = "LOGIN";
const _token = "TOKEN";
const _name = "NAME";
const _tokenFirebase = "TOKENFIREBASE";

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_token, token);
    return token;
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(_token);
    if (token != null) {
      return token;
    } else {
      Get.offAllNamed(Routes.login);
      return "";
    }
  }

  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<LoginRequest?> getLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final login = sharedPreferences.getString(_login);
    if (login != null) {
      return loginRequestFromJson(login);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveLogin(LoginRequest _loginRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_login, loginRequestToJson(_loginRequest));
  }

  @override
  Future<String> saveTokenFirebase(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenFirebase, token);
    return token;
  }

  @override
  Future<String?> getTokenFirebase() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(_tokenFirebase);
    if (token != null) {
      return token;
    } else {
      return null;
    }
  }

  @override
  Future<void> saveName(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_name, name);
  }

  @override
  Future<String?> getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString(_name);
    if (name != null) {
      return name;
    } else {
      return null;
    }
  }
}
